module model.vehicle_update;

/**
 * Class that partly describes a vehicle. Contains a unique vehicle's identifier as well as all vehicle's fields that
 * may be changed during the game.
 */
immutable class VehicleUpdate
{
nothrow pure @safe @nogc:

    /**
     * Returns: unique object's identifier.
     */
    long id;
    /**
     * Returns: the X of the unit's center. The X-axis is directed from left to right.
     */
    double x;
    /**
     * Returns: the Y of the unit's center. The Y-axis is directed downward.
     */
    double y;
    /**
     * Returns: current durability, or `0` if the vehicle has either been destroyed or became invisible to you.
     */
    int durability;
    /**
     * Returns: amount of ticks before the vehicle can attack again.
     * In order to attack this value has to be equal zero.
     */
    int remainingAttackCooldownTicks;
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
        int durability,
        int remainingAttackCooldownTicks,
        bool selected,
        immutable int [] groups)
    {
        this.id = id;
        this.x = x;
        this.y = y;
        this.durability = durability;
        this.remainingAttackCooldownTicks = remainingAttackCooldownTicks;
        this.selected = selected;
        this.groups = groups;
    }
}
