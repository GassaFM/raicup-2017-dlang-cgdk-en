module model.vehicle_type;

import model.vehicle;

/**
 * Vehicle type.
 */
enum VehicleType : byte
{
    /**
     * Armored repair and recovery vehicle. Ground unit.
     * Gradually restores durability of nearby vehicles.
     */
    arrv,

    /**
     * Fighter. Aerial unit. Effective against other aerial units. Can not attack ground units.
     */
    fighter,

    /**
     * Attack helicopter. Aerial unit. Can attack both aerial and ground units.
     */
    helicopter,

    /**
     * Infantry fighting vehicle. Ground unit. Can attack both aerial and ground units.
     */
    ifv,

    /**
     * Tank. Ground unit. Effective against other ground units. Can also attack aerial units.
     */
    tank
}

