module model.facility_type;

import model.facility;

/**
 * Facility type.
 */
enum FacilityType : byte
{
    /**
     * Increases the limit of player actions for `game.additionalActionCountPerControlCenter` per
     * `game.actionDetectionInterval` game ticks. Also slightly reduced cooldown of tactical nuclear strikes.
     */
    controlCenter,

    /**
     * The factory can produce vehicles of any type.
     */
    vehicleFactory
}

