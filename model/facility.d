module model.facility;

import model.vehicle_type;
import model.facility_type;

/**
 * This class describes a facility. A facility is a rectangular area on the map.
 */
immutable class Facility
{
nothrow pure @safe @nogc:

    /**
     * Returns: the unique facility id
     */
    long id;
    /**
     * Returns: the facility type.
     */
    FacilityType type;
    /**
     * Returns: the owner player id or `-1`.
     */
    long ownerPlayerId;
    /**
     * Returns: the leftmost X of the facility.
     */
    double left;
    /**
     * Returns: the topmost Y of the facility.
     */
    double top;
    /**
     * Returns: the capture level of the facility in the range of `-game.maxFacilityCapturePoints` to
     * `game.maxFacilityCapturePoints`. The positive level means, that you are capturing this facility.
     * The negative level means, that some other player is capturing this facility.
     */
    double capturePoints;
    /**
     * Returns: the type of the vehicle that this factory produces or `null`. For control center the value is
     * always `null`.
     */
    VehicleType vehicleType;
    /**
     * Returns: the nonnegative number that is vehicle production progress. For control center the value is always
     * `0`.
     */
    int productionProgress;

    this (
        long id,
        immutable FacilityType type,
        long ownerPlayerId,
        double left,
        double top,
        double capturePoints,
        immutable VehicleType vehicleType,
        int productionProgress)
    {
        this.id = id;
        this.type = type;
        this.ownerPlayerId = ownerPlayerId;
        this.left = left;
        this.top = top;
        this.capturePoints = capturePoints;
        this.vehicleType = vehicleType;
        this.productionProgress = productionProgress;
    }
}
