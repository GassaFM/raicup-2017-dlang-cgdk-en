module model.unit;
import std.math : hypot;

/**
 * Base class that describes any object (``unit'') in the game world.
 */
abstract immutable class Unit
{
nothrow pure @safe @nogc:

    /**
     * Returns: the unique unit id.
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

    protected this (
        long id,
        double x,
        double y)
    {
        this.id = id;
        this.x = x;
        this.y = y;
    }

    /**
     * Params:
     *   x = X-coordinate of the point to get the distance to.
     *   y = Y-coordinate of the point to get the distance to.
     * Returns: the range between the specified point and the center of this unit.
     */
    double getDistanceTo (
        double x,
        double y) const
    {
        return hypot (x - this.x, y - this.y);
    }

    /**
     * Params:
     *   unit = the unit to get the distance to.
     * Returns: the range between the center of the specified unit and the center of this unit.
     */
    double getDistanceTo (
        immutable Unit unit) const
    {
        return getDistanceTo (unit.x, unit.y);
    }

    /**
     * Params:
     *   x = X-coordinate of the point to get the distance to.
     *   y = Y-coordinate of the point to get the distance to.
     * Returns: the squared range between the specified point and the center of this unit.
     */
    double getSquaredDistanceTo (
        double x,
        double y) const
    {
        double dx = x - this.x;
        double dy = y - this.y;
        return dx * dx + dy * dy;
    }

    /**
     * Params:
     *   unit = the unit to get the distance to.
     * Returns: the squared range between the center of the specified unit and the center of this unit.
     */
    double getSquaredDistanceTo (
        immutable Unit unit) const
    {
        return getSquaredDistanceTo (unit.x, unit.y);
    }
}
