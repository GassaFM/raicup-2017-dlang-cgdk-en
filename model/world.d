module model.world;

import model.facility;
import model.weather_type;
import model.vehicle_update;
import model.vehicle;
import model.player;
import model.terrain_type;

/**
 * This class describes a game world. A world contains all players and game objects (``units’’).
 */
immutable class World
{
nothrow pure @safe @nogc:

    /**
     * Returns: the current game tick.
     */
    int tickIndex;
    /**
     * Returns: the base game duration in ticks. A real game duration may be lower. Equals to `game.tickCount`.
     */
    int tickCount;
    /**
     * Returns: the world width.
     */
    double width;
    /**
     * Returns: the world height.
     */
    double height;
    /**
     * Returns: all players (in random order). After each tick the player objects are recreated.
     */
    Player [] players;
    /**
     * Returns: list of vehicles that had no information availavle in the precious tick.
     * It contains both newly created vehicles and those that already existed but were not visible before.
     */
    Vehicle [] newVehicles;
    /**
     * Returns: changing field values for each visible vehicle if at least one of these fields has been changed.
     * Durability value zero means that the vehicle is either destroyed or became invisible for you.
     */
    VehicleUpdate [] vehicleUpdates;
    /**
     * Returns: terrain map.
     */
    TerrainType [] [] terrainByCellXY;
    /**
     * Returns: weather map.
     */
    WeatherType [] [] weatherByCellXY;
    /**
     * Returns: list of facilities (in random order).
     * Depending on implementation, corresponding objects may be or not recreated each tick.
     */
    Facility [] facilities;

    this (
        int tickIndex,
        int tickCount,
        double width,
        double height,
        immutable Player [] players,
        immutable Vehicle [] newVehicles,
        immutable VehicleUpdate [] vehicleUpdates,
        immutable TerrainType [] [] terrainByCellXY,
        immutable WeatherType [] [] weatherByCellXY,
        immutable Facility [] facilities)
    {
        this.tickIndex = tickIndex;
        this.tickCount = tickCount;
        this.width = width;
        this.height = height;
        this.players = players;
        this.newVehicles = newVehicles;
        this.vehicleUpdates = vehicleUpdates;
        this.terrainByCellXY = terrainByCellXY;
        this.weatherByCellXY = weatherByCellXY;
        this.facilities = facilities;
    }

    /**
     * Returns: your player.
     */
    immutable (Player) getMyPlayer ()
    {
        foreach (player; players) {
            if (player.me) {
                return player;
            }
        }

        return null;
    }

    /**
     * Returns: opponent's player.
     */
    immutable (Player) getOpponentPlayer ()
    {
        foreach (player; players) {
            if (!player.me) {
                return player;
            }
        }

        return null;
    }
}
