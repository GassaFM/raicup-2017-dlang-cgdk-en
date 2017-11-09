module model.vehicle_type;

/**
 * Тип техники.
 */
enum VehicleType : byte
{
    /**
     * Бронированная ремонтно-эвакуационная машина. Наземный юнит.
     * Постепенно восстанавливает прочность находящейся поблизости неподвижной техники.
     */
    arrv,

    /**
     * Истребитель. Воздушный юнит. Крайне эффективен против другой воздушной техники. Не может атаковать наземные цели.
     */
    fighter,

    /**
     * Ударный вертолёт. Воздушный юнит. Может атаковать как воздушные, так и наземные цели.
     */
    helicopter,

    /**
     * Боевая машина пехоты. Наземный юнит. Может атаковать как воздушные, так и наземные цели.
     */
    ifv,

    /**
     * Танк. Наземный юнит. Крайне эффективен против другой наземной техники. Также может атаковать воздушные цели.
     */
    tank
}

