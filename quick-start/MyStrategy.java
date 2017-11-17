import model.*;

import java.util.*;
import java.util.function.Consumer;
import java.util.stream.Stream;

@SuppressWarnings({"UnsecureRandomNumberGeneration", "FieldCanBeLocal", "unused", "OverlyLongMethod"})
public final class MyStrategy implements Strategy {
    /**
     * A map from vehicle type to target types ordered by effective damage descending.
     */
    private static final Map<VehicleType, VehicleType[]> preferredTargetTypesByVehicleType;

    static {
        preferredTargetTypesByVehicleType = new EnumMap<>(VehicleType.class);

        preferredTargetTypesByVehicleType.put(VehicleType.FIGHTER, new VehicleType[] {
                VehicleType.HELICOPTER, VehicleType.FIGHTER
        });

        preferredTargetTypesByVehicleType.put(VehicleType.HELICOPTER, new VehicleType[] {
                VehicleType.TANK, VehicleType.ARRV, VehicleType.HELICOPTER, VehicleType.IFV, VehicleType.FIGHTER
        });

        preferredTargetTypesByVehicleType.put(VehicleType.IFV, new VehicleType[] {
                VehicleType.HELICOPTER, VehicleType.ARRV, VehicleType.IFV, VehicleType.FIGHTER, VehicleType.TANK
        });

        preferredTargetTypesByVehicleType.put(VehicleType.TANK, new VehicleType[] {
                VehicleType.IFV, VehicleType.ARRV, VehicleType.TANK, VehicleType.FIGHTER, VehicleType.HELICOPTER
        });
    }

    private Random random;

    private TerrainType[][] terrainTypeByCellXY;
    private WeatherType[][] weatherTypeByCellXY;

    private Player me;
    private World world;
    private Game game;
    private Move move;

    private final Map<Long, Vehicle> vehicleById = new HashMap<>();
    private final Map<Long, Integer> updateTickByVehicleId = new HashMap<>();
    private final Queue<Consumer<Move>> delayedMoves = new ArrayDeque<>();

    /**
     * Main strategy method, controlling the vehicles.
     * The game engine calls this method once each time tick.
     *
     * @param me    the owner player of this strategy.
     * @param world the current world snapshot.
     * @param game  many game constants.
     * @param move  the object that encapsulates all strategy instructions.
     */
    @Override
    public void move(Player me, World world, Game game, Move move) {
        initializeStrategy(world, game);
        initializeTick(me, world, game, move);

        if (me.getRemainingActionCooldownTicks() > 0) {
            return;
        }

        if (executeDelayedMove()) {
            return;
        }

        move();

        executeDelayedMove();
    }

    /**
     * Initialize our strategy.
     * <p>
     * Usually you can use a constructor, but in this case we want to initialize the generator of random numbers
     * with a value obtained from the game engine.
     */
    private void initializeStrategy(World world, Game game) {
        if (random == null) {
            random = new Random(game.getRandomSeed());

            terrainTypeByCellXY = world.getTerrainByCellXY();
            weatherTypeByCellXY = world.getWeatherByCellXY();
        }
    }

    /**
     * Save all input data in the strategy fields for simpler access and actualize vehicle data.
     */
    private void initializeTick(Player me, World world, Game game, Move move) {
        this.me = me;
        this.world = world;
        this.game = game;
        this.move = move;

        for (Vehicle vehicle : world.getNewVehicles()) {
            vehicleById.put(vehicle.getId(), vehicle);
            updateTickByVehicleId.put(vehicle.getId(), world.getTickIndex());
        }

        for (VehicleUpdate vehicleUpdate : world.getVehicleUpdates()) {
            long vehicleId = vehicleUpdate.getId();

            if (vehicleUpdate.getDurability() == 0) {
                vehicleById.remove(vehicleId);
                updateTickByVehicleId.remove(vehicleId);
            } else {
                vehicleById.put(vehicleId, new Vehicle(vehicleById.get(vehicleId), vehicleUpdate));
                updateTickByVehicleId.put(vehicleId, world.getTickIndex());
            }
        }
    }

    /**
     * Take delayed move from queue and execute.
     *
     * @return {@code true} if and only if a delayed move has been found and executed.
     */
    private boolean executeDelayedMove() {
        Consumer<Move> delayedMove = delayedMoves.poll();
        if (delayedMove == null) {
            return false;
        }

        delayedMove.accept(move);
        return true;
    }

    /**
     * The core logic of our strategy.
     */
    private void move() {
        // Every 180 ticks ...
        if (world.getTickIndex() % 180 == 0) {
            // ... for each vehicle type ...
            for (VehicleType vehicleType : VehicleType.values()) {
                VehicleType[] targetTypes = preferredTargetTypesByVehicleType.get(vehicleType);

                // ... if it can attack ...
                if (targetTypes == null || targetTypes.length == 0) {
                    continue;
                }

                // ... find center of our formation ...
                double x = streamVehicles(
                        Ownership.ALLY, vehicleType
                ).mapToDouble(Vehicle::getX).average().orElse(Double.NaN);

                double y = streamVehicles(
                        Ownership.ALLY, vehicleType
                ).mapToDouble(Vehicle::getY).average().orElse(Double.NaN);

                // ... find center of enemy formation or center of the world ...
                double targetX = Arrays.stream(targetTypes).map(
                        targetType -> streamVehicles(
                                Ownership.ENEMY, targetType
                        ).mapToDouble(Vehicle::getX).average().orElse(Double.NaN)
                ).filter(Double::isFinite).findFirst().orElseGet(
                        () -> streamVehicles(
                                Ownership.ENEMY
                        ).mapToDouble(Vehicle::getX).average().orElse(world.getWidth() / 2.0D)
                );

                double targetY = Arrays.stream(targetTypes).map(
                        targetType -> streamVehicles(
                                Ownership.ENEMY, targetType
                        ).mapToDouble(Vehicle::getY).average().orElse(Double.NaN)
                ).filter(Double::isFinite).findFirst().orElseGet(
                        () -> streamVehicles(
                                Ownership.ENEMY
                        ).mapToDouble(Vehicle::getY).average().orElse(world.getHeight() / 2.0D)
                );

                // .. and add delayed moves to select and move our vehicles.
                if (!Double.isNaN(x) && !Double.isNaN(y)) {
                    delayedMoves.add(move -> {
                        move.setAction(ActionType.CLEAR_AND_SELECT);
                        move.setRight(world.getWidth());
                        move.setBottom(world.getHeight());
                        move.setVehicleType(vehicleType);
                    });

                    delayedMoves.add(move -> {
                        move.setAction(ActionType.MOVE);
                        move.setX(targetX - x);
                        move.setY(targetY - y);
                    });
                }
            }

            // Also find center of our ARRV formation ...
            double x = streamVehicles(
                    Ownership.ALLY, VehicleType.ARRV
            ).mapToDouble(Vehicle::getX).average().orElse(Double.NaN);

            double y = streamVehicles(
                    Ownership.ALLY, VehicleType.ARRV
            ).mapToDouble(Vehicle::getY).average().orElse(Double.NaN);

            // .. and send it to the center of the world.
            if (!Double.isNaN(x) && !Double.isNaN(y)) {
                delayedMoves.add(move -> {
                    move.setAction(ActionType.CLEAR_AND_SELECT);
                    move.setRight(world.getWidth());
                    move.setBottom(world.getHeight());
                    move.setVehicleType(VehicleType.ARRV);
                });

                delayedMoves.add(move -> {
                    move.setAction(ActionType.MOVE);
                    move.setX(world.getWidth() / 2.0D - x);
                    move.setY(world.getHeight() / 2.0D - y);
                });
            }

            return;
        }

        // If all our vehicles are stuck for 60 ticks ...
        if (streamVehicles(Ownership.ALLY).allMatch(
                vehicle -> world.getTickIndex() - updateTickByVehicleId.get(vehicle.getId()) > 60
        )) {
            // ... find center of our formation ...
            double x = streamVehicles(Ownership.ALLY).mapToDouble(Vehicle::getX).average().orElse(Double.NaN);
            double y = streamVehicles(Ownership.ALLY).mapToDouble(Vehicle::getY).average().orElse(Double.NaN);

            // ... and rotate it.
            if (!Double.isNaN(x) && !Double.isNaN(y)) {
                delayedMoves.add(move -> {
                    move.setAction(ActionType.CLEAR_AND_SELECT);
                    move.setRight(world.getWidth());
                    move.setBottom(world.getHeight());
                });

                delayedMoves.add(move -> {
                    move.setAction(ActionType.ROTATE);
                    move.setX(x);
                    move.setY(y);
                    move.setAngle(random.nextBoolean() ? StrictMath.PI : -StrictMath.PI);
                });
            }
        }
    }

    private Stream<Vehicle> streamVehicles(Ownership ownership, VehicleType vehicleType) {
        Stream<Vehicle> stream = vehicleById.values().stream();

        switch (ownership) {
            case ALLY:
                stream = stream.filter(vehicle -> vehicle.getPlayerId() == me.getId());
                break;
            case ENEMY:
                stream = stream.filter(vehicle -> vehicle.getPlayerId() != me.getId());
                break;
            default:
        }

        if (vehicleType != null) {
            stream = stream.filter(vehicle -> vehicle.getType() == vehicleType);
        }

        return stream;
    }

    private Stream<Vehicle> streamVehicles(Ownership ownership) {
        return streamVehicles(ownership, null);
    }

    private Stream<Vehicle> streamVehicles() {
        return streamVehicles(Ownership.ANY);
    }

    private enum Ownership {
        ANY,

        ALLY,

        ENEMY
    }
}
