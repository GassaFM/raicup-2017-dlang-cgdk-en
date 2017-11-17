module model.move;
import std.typecons;

import model.vehicle_type;
import model.action_type;

/**
 * An encapsulated result of each move of your strategy.
 */
class Move
{
nothrow pure @safe @nogc:

    /**
     * Sets the desired action.
     */
    Nullable !(ActionType, cast (ActionType) (-1)) action;
    /**
     * Sets the group of units for various actions.
     * $(BR)
     * This parameter is optional for `ActionType.clearAndSelect`, `ActionType.addToSelection` and
     * `ActionType.deselect`. If the group is set for these actions, then all other parameters
     * (`vehicleType`, `left`, `top`, `right`, `bottom`) will be ignored.
     * $(BR)
     * This parameter is required for `ActionType.assign`, `ActionType.dismiss` and
     * `ActionType.disband`. This is the only parameter for `ActionType.disband`.
     * $(BR)
     * The correct values are integers in range of `1` to `game.maxUnitGroup` both inclusive.
     */
    int group = 0;
    /**
     * Sets the leftmost X of selection rectangle.
     * $(BR)
     * This is required parameter for `ActionType.clearAndSelect`, `ActionType.addToSelection` and
     * `ActionType.deselect`, if the group is not set. Otherwise this value will be ignored.
     * $(BR)
     * The correct values are real numbers in range of `0.0` to `right` both inclusive.
     */
    double left = 0.0;
    /**
     * Sets the topmost Y of selection rectangle.
     * $(BR)
     * This is required parameter for `ActionType.clearAndSelect`, `ActionType.addToSelection` and
     * `ActionType.deselect`, if the group is not set. Otherwise this value will be ignored.
     * $(BR)
     * The correct values are real numbers in range of `0.0` to `bottom` both inclusive.
     */
    double top = 0.0;
    /**
     * Sets the rightmost X of selection rectangle.
     * $(BR)
     * This is required parameter for `ActionType.clearAndSelect`, `ActionType.addToSelection` and
     * `ActionType.deselect`, if the group is not set. Otherwise this value will be ignored.
     * $(BR)
     * The correct values are real numbers in range of `left` to `game.worldWidth` both inclusive.
     */
    double right = 0.0;
    /**
     * Sets the bottommost Y of selection rectangle.
     * $(BR)
     * This is required parameter for `ActionType.clearAndSelect`, `ActionType.addToSelection` and
     * `ActionType.deselect`, if the group is not set. Otherwise this value will be ignored.
     * $(BR)
     * The correct values are real numbers in range of `top` to `game.worldHeight` both inclusive.
     */
    double bottom = 0.0;
    /**
     * Sets the X of a point or vector.
     * $(BR)
     * This is required parameter for `ActionType.move` and specifies the X offset.
     * $(BR)
     * This is required parameter for `ActionType.rotate` and specifies the X of the rotation center.
     * $(BR)
     * This is required parameter for `ActionType.scale` and specifies the X of the scale pivot.
     * $(BR)
     * This is required parameter for `ActionType.tacticalNuclearStrike` and specifies the X of the explosion
     * center.
     * $(BR)
     * The correct values for `ActionType.move` are real numbers in range of `-game.worldWidth` to
     * `game.worldWidth` both inclusive. The correct values for `ActionType.rotate` and
     * `ActionType.scale` are real numbers in range of `-game.worldWidth` to `2.0 * game.worldWidth`
     * both inclusive. The correct values for `ActionType.tacticalNuclearStrike` are real numbers in range of
     * `0.0` to `game.worldWidth` both inclusive.
     */
    double x = 0.0;
    /**
     * Sets the Y of a point or vector.
     * $(BR)
     * This is required parameter for `ActionType.move` and specifies the Y offset.
     * $(BR)
     * This is required parameter for `ActionType.rotate` and specifies the Y of the rotation center.
     * $(BR)
     * This is required parameter for `ActionType.scale` and specifies the Y of the scale pivot.
     * $(BR)
     * This is required parameter for `ActionType.tacticalNuclearStrike` and specifies the Y of the explosion
     * center.
     * $(BR)
     * The correct values for `ActionType.move` are real numbers in range of `-game.worldHeight` to
     * `game.worldHeight` both inclusive. The correct values for `ActionType.rotate` and
     * `ActionType.scale` are real numbers in range of `-game.worldHeight` to `2.0 * game.worldHeight`
     * both inclusive. The correct values for `ActionType.tacticalNuclearStrike` are real numbers in range of
     * `0.0` to `game.worldHeight` both inclusive.
     */
    double y = 0.0;
    /**
     * Sets the rotation angle.
     * $(BR)
     * This is required parameter for `ActionType.rotate`. The positive values mean clockwise rotation.
     * $(BR)
     * The correct values are real numbers in range of `-PI` to `PI` both inclusive.
     */
    double angle = 0.0;
    /**
     * Sets the scale factor.
     * $(BR)
     * This is required parameter for `ActionType.scale`. The values greater than `1.0` increase formation
     * size, the values less than `1.0` decrease formation size.
     * $(BR)
     * The correct values are real numbers in range of `0.1` to `10.0` both inclusive.
     */
    double factor = 0.0;
    /**
     * Sets the speed limit.
     * $(BR)
     * This is optional parameter for `ActionType.move`, `ActionType.rotate` and `ActionType.scale`.
     * If for `ActionType.rotate` the max angular speed is set, then this parameter will be ignored.
     * $(BR)
     * The correct values are real nonnegative numbers. The special `0.0` value means that there is no limit.
     */
    double maxSpeed = 0.0;
    /**
     * Sets the angular speed limit.
     * $(BR)
     * This is optional parameter for `ActionType.rotate`. If this parameter is set, then `maxSpeed` will be
     * ignored.
     * $(BR)
     * The correct values are real numbers in range of `0.0` to `PI` both inclusive. The special `0.0`
     * value means that there is no limit.
     */
    double maxAngularSpeed = 0.0;
    /**
     * Sets the vehicle type.
     * $(BR)
     * This is optional filter parameter for `ActionType.clearAndSelect`, `ActionType.addToSelection`
     * and `ActionType.deselect`. This parameter will be ignored, if the group is set.
     * $(BR)
     * This is optional filter parameter for `ActionType.setupVehicleProduction`. The production progress will
     * be zeroed in any case.
     */
    Nullable !(VehicleType, cast (VehicleType) (-1)) vehicleType;
    /**
     * Sets the facility id.
     * $(BR)
     * This is required parameter for `ActionType.setupVehicleProduction`. If there is no factory with this id
     * or it is not owned by your strategy, then the action will be ignored.
     */
    long facilityId = -1L;
    /**
     * Sets the vehicle id.
     * $(BR)
     * This is required parameter for `ActionType.tacticalNuclearStrike`. The action will be ignored, if there
     * is no vehicle with this id, if unit with this id is owned by other player or if the nuclear strike target is
     * beyond the vision range of the specified unit.
     */
    long vehicleId = -1L;
}
