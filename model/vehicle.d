module model.vehicle;

import model.vehicle_type;
import model.vehicle_update;
import model.circular_unit;

/**
 * Class describing a vehicle. Also contains all properties of a circular unit.
 */
immutable class Vehicle : CircularUnit
{
nothrow pure @safe @nogc:

    /**
     * Returns: owner player's id.
     */
    long playerId;
    /**
     * Returns: current durability.
     */
    int durability;
    /**
     * Returns: maximal durability.
     */
    int maxDurability;
    /**
     * Returns: maximal distance that can be travelled in one tick
     * when not affected by terrain or weather. While rotating arc length is taken into account,
     * not the distance between start and finish positions.
     */
    double maxSpeed;
    /**
     * Returns: maximal range (from center to center) at which this vehicle can detect other objects,
     * when not affected by terrain or weather.
     */
    double visionRange;
    /**
     * Returns: squared maximal range (from center to center) at which this vehicle can detect other objects,
     * when not affected by terrain or weather.
     */
    double squaredVisionRange;
    /**
     * Returns: maximal range (from center to center) at which this vehicle can attack ground units.
     */
    double groundAttackRange;
    /**
     * Returns: squared maximal range (from center to center) at which this vehicle can attack ground units.
     */
    double squaredGroundAttackRange;
    /**
     * Returns: maximal range (from center to center) at which this vehicle can attack aerial units.
     */
    double aerialAttackRange;
    /**
     * Returns: squared maximal range (from center to center) at which this vehicle can attack aerial units.
     */
    double squaredAerialAttackRange;
    /**
     * Returns: damage of one attack dealt to a ground unit.
     */
    int groundDamage;
    /**
     * Returns: damage of one attack dealt to an aerial unit.
     */
    int aerialDamage;
    /**
     * Returns: value of defence from ground units' attacks.
     */
    int groundDefence;
    /**
     * Returns: value of defence from aerial units' attacks.
     */
    int aerialDefence;
    /**
     * Returns: minimal possible interval between attacks.
     */
    int attackCooldownTicks;
    /**
     * Returns: amount of ticks before the vehicle can attack again.
     * In order to attack this value has to be equal zero.
     */
    int remainingAttackCooldownTicks;
    /**
     * Returns: vehicle's type.
     */
    VehicleType type;
    /**
     * Returns: `true` iff the vehicle is aerial.
     */
    bool aerial;
    /**
     * Returns: `true` iff the vehicle is selected.
     */
    bool selected;
    /**
     * Returns: list of groups that the vehicle belongs to.
     */
    int [] groups;

    this (
        long id,
        double x,
        double y,
        double radius,
        long playerId,
        int durability,
        int maxDurability,
        double maxSpeed,
        double visionRange,
        double squaredVisionRange,
        double groundAttackRange,
        double squaredGroundAttackRange,
        double aerialAttackRange,
        double squaredAerialAttackRange,
        int groundDamage,
        int aerialDamage,
        int groundDefence,
        int aerialDefence,
        int attackCooldownTicks,
        int remainingAttackCooldownTicks,
        immutable VehicleType type,
        bool aerial,
        bool selected,
        immutable int [] groups)
    {
        super (id, x, y, radius);

        this.playerId = playerId;
        this.durability = durability;
        this.maxDurability = maxDurability;
        this.maxSpeed = maxSpeed;
        this.visionRange = visionRange;
        this.squaredVisionRange = squaredVisionRange;
        this.groundAttackRange = groundAttackRange;
        this.squaredGroundAttackRange = squaredGroundAttackRange;
        this.aerialAttackRange = aerialAttackRange;
        this.squaredAerialAttackRange = squaredAerialAttackRange;
        this.groundDamage = groundDamage;
        this.aerialDamage = aerialDamage;
        this.groundDefence = groundDefence;
        this.aerialDefence = aerialDefence;
        this.attackCooldownTicks = attackCooldownTicks;
        this.remainingAttackCooldownTicks = remainingAttackCooldownTicks;
        this.type = type;
        this.aerial = aerial;
        this.selected = selected;
        this.groups = groups;
    }

    this (
        immutable Vehicle vehicle,
        immutable VehicleUpdate vehicleUpdate)
    {
        super (vehicle.id, vehicleUpdate.x, vehicleUpdate.y, vehicle.radius);

        this.playerId = vehicle.playerId;
        this.durability = vehicleUpdate.durability;
        this.maxDurability = vehicle.maxDurability;
        this.maxSpeed = vehicle.maxSpeed;
        this.visionRange = vehicle.visionRange;
        this.squaredVisionRange = vehicle.squaredVisionRange;
        this.groundAttackRange = vehicle.groundAttackRange;
        this.squaredGroundAttackRange = vehicle.squaredGroundAttackRange;
        this.aerialAttackRange = vehicle.aerialAttackRange;
        this.squaredAerialAttackRange = vehicle.squaredAerialAttackRange;
        this.groundDamage = vehicle.groundDamage;
        this.aerialDamage = vehicle.aerialDamage;
        this.groundDefence = vehicle.groundDefence;
        this.aerialDefence = vehicle.aerialDefence;
        this.attackCooldownTicks = vehicle.attackCooldownTicks;
        this.remainingAttackCooldownTicks = vehicleUpdate.remainingAttackCooldownTicks;
        this.type = vehicle.type;
        this.aerial = vehicle.aerial;
        this.selected = vehicleUpdate.selected;
        this.groups = vehicleUpdate.groups;
    }
}
