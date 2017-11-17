module model.circular_unit;

import model.unit;

/**
 * This base class describes any circular unit in the game world.
 */
abstract immutable class CircularUnit : Unit
{
nothrow pure @safe @nogc:

    /**
     * Returns: the radius of this unit.
     */
    double radius;

    protected this (
        long id,
        double x,
        double y,
        double radius)
    {
        super (id, x, y);

        this.radius = radius;
    }
}
