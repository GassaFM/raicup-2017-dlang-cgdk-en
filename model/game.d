module model.game;

/**
 * An instance of this class contains all game constants.
 */
immutable class Game
{
nothrow pure @safe @nogc:

    /**
     * Returns: the number that is highly recommended to use as a seed for rng (generator of pseudo-random numbers).
     */
    long randomSeed;
    /**
     * Returns: the base game duration in ticks. A real game duration may be lower. Equals to `world.tickCount`.
     */
    int tickCount;
    /**
     * Returns: the width of the map.
     */
    double worldWidth;
    /**
     * Returns: the height of the map.
     */
    double worldHeight;
    /**
     * Returns: `true` if and only if the fog of war is enabled in the current game.
     */
    bool fogOfWarEnabled;
    /**
     * Returns: the amount of score points received for destroying all enemy units.
     */
    int victoryScore;
    /**
     * Returns: the amount of score points for capturing a facility.
     */
    int facilityCaptureScore;
    /**
     * Returns: the amount of score points for destroying a single enemy unit.
     */
    int vehicleEliminationScore;
    /**
     * Returns: the interval that is used to limit player actions.
     */
    int actionDetectionInterval;
    /**
     * Returns: the base action count that player can perform in `actionDetectionInterval` ticks.
     */
    int baseActionCount;
    /**
     * Returns: the additional action count per each captured control center.
     */
    int additionalActionCountPerControlCenter;
    /**
     * Returns: the max index of a unit group.
     */
    int maxUnitGroup;
    /**
     * Returns: the count of columns in terrain/weather maps.
     */
    int terrainWeatherMapColumnCount;
    /**
     * Returns: the count of rows in terrain/weather maps.
     */
    int terrainWeatherMapRowCount;
    /**
     * Returns: the vision range factor of a ground vehicle in plain terrain.
     */
    double plainTerrainVisionFactor;
    /**
     * Returns: the vision range factor of any vehicle that is trying to detect a ground vehicle in plain terrain.
     */
    double plainTerrainStealthFactor;
    /**
     * Returns: the speed factor of ground vehicles in plain terrain.
     */
    double plainTerrainSpeedFactor;
    /**
     * Returns: the vision range factor of a ground vehicle in swamp terrain.
     */
    double swampTerrainVisionFactor;
    /**
     * Returns: the vision range factor of any vehicle that is trying to detect a ground vehicle in swamp terrain.
     */
    double swampTerrainStealthFactor;
    /**
     * Returns: the speed factor of ground vehicles in swamp terrain.
     */
    double swampTerrainSpeedFactor;
    /**
     * Returns: the vision range factor of a ground vehicle in forest terrain.
     */
    double forestTerrainVisionFactor;
    /**
     * Returns: the vision range factor of any vehicle that is trying to detect a ground vehicle in forest terrain.
     */
    double forestTerrainStealthFactor;
    /**
     * Returns: the speed factor of ground vehicles in forest terrain.
     */
    double forestTerrainSpeedFactor;
    /**
     * Returns: the vision range factor of an aerial vehicle in clear weather.
     */
    double clearWeatherVisionFactor;
    /**
     * Returns: the vision range factor of any vehicle that is trying to detect an aerial vehicle in clear weather.
     */
    double clearWeatherStealthFactor;
    /**
     * Returns: the speed factor of aerial vehicles in clear weather.
     */
    double clearWeatherSpeedFactor;
    /**
     * Returns: the vision range factor of an aerial vehicle in cloud weather.
     */
    double cloudWeatherVisionFactor;
    /**
     * Returns: the vision range factor of any vehicle that is trying to detect an aerial vehicle in cloud weather.
     */
    double cloudWeatherStealthFactor;
    /**
     * Returns: the speed factor of aerial vehicles in cloud weather.
     */
    double cloudWeatherSpeedFactor;
    /**
     * Returns: the vision range factor of an aerial vehicle in rain weather.
     */
    double rainWeatherVisionFactor;
    /**
     * Returns: the vision range factor of any vehicle that is trying to detect an aerial vehicle in rain weather.
     */
    double rainWeatherStealthFactor;
    /**
     * Returns: the speed factor of aerial vehicles in rain weather.
     */
    double rainWeatherSpeedFactor;
    /**
     * Returns: the radius of a vehicle.
     */
    double vehicleRadius;
    /**
     * Returns: the maximal durability of a tank.
     */
    int tankDurability;
    /**
     * Returns: the maximal speed of a tank.
     */
    double tankSpeed;
    /**
     * Returns: the base vision range of a tank.
     */
    double tankVisionRange;
    /**
     * Returns: the attack range of a tank against ground targets.
     */
    double tankGroundAttackRange;
    /**
     * Returns: the attack range of a tank against aerial targets.
     */
    double tankAerialAttackRange;
    /**
     * Returns: the attack damage of a tank against ground targets.
     */
    int tankGroundDamage;
    /**
     * Returns: the attack damage of a tank against aerial targets.
     */
    int tankAerialDamage;
    /**
     * Returns: the defence of a tank against ground attacks.
     */
    int tankGroundDefence;
    /**
     * Returns: the defence of a tank against aerial attacks.
     */
    int tankAerialDefence;
    /**
     * Returns: the attack cooldown of a tank.
     */
    int tankAttackCooldownTicks;
    /**
     * Returns: the amount of ticks to produce a tank on a factory.
     */
    int tankProductionCost;
    /**
     * Returns: the maximal durability of an ifv.
     */
    int ifvDurability;
    /**
     * Returns: the maximal speed of an ifv.
     */
    double ifvSpeed;
    /**
     * Returns: the base vision range of an ifv.
     */
    double ifvVisionRange;
    /**
     * Returns: the attack range of an ifv against ground targets.
     */
    double ifvGroundAttackRange;
    /**
     * Returns: the attack range of an ifv against aerial targets.
     */
    double ifvAerialAttackRange;
    /**
     * Returns: the attack damage of an ifv against ground targets.
     */
    int ifvGroundDamage;
    /**
     * Returns: the attack damage of an ifv against aerial targets.
     */
    int ifvAerialDamage;
    /**
     * Returns: the defence of an ifv against ground attacks.
     */
    int ifvGroundDefence;
    /**
     * Returns: the defence of an ifv against aerial attacks.
     */
    int ifvAerialDefence;
    /**
     * Returns: the attack cooldown of an ifv.
     */
    int ifvAttackCooldownTicks;
    /**
     * Returns: the amount of ticks to produce an ifv on a factory.
     */
    int ifvProductionCost;
    /**
     * Returns: the maximal durability of an arrv.
     */
    int arrvDurability;
    /**
     * Returns: the maximal speed of an arrv.
     */
    double arrvSpeed;
    /**
     * Returns: the base vision range of an arrv.
     */
    double arrvVisionRange;
    /**
     * Returns: the defence of an arrv against ground attacks.
     */
    int arrvGroundDefence;
    /**
     * Returns: the defence of an arrv against aerial attacks.
     */
    int arrvAerialDefence;
    /**
     * Returns: the amount of ticks to produce an arrv on a factory.
     */
    int arrvProductionCost;
    /**
     * Returns: the repair range of an arrv.
     */
    double arrvRepairRange;
    /**
     * Returns: the repair amount of an arrv per tick.
     */
    double arrvRepairSpeed;
    /**
     * Returns: the maximal durability of a helicopter.
     */
    int helicopterDurability;
    /**
     * Returns: the maximal speed of a helicopter.
     */
    double helicopterSpeed;
    /**
     * Returns: the base vision range of a helicopter.
     */
    double helicopterVisionRange;
    /**
     * Returns: the attack range of a helicopter against ground targets.
     */
    double helicopterGroundAttackRange;
    /**
     * Returns: the attack range of a helicopter against aerial targets.
     */
    double helicopterAerialAttackRange;
    /**
     * Returns: the attack damage of a helicopter against ground targets.
     */
    int helicopterGroundDamage;
    /**
     * Returns: the attack damage of a helicopter against aerial targets.
     */
    int helicopterAerialDamage;
    /**
     * Returns: the defence of a helicopter against ground attacks.
     */
    int helicopterGroundDefence;
    /**
     * Returns: the defence of a helicopter against aerial attacks.
     */
    int helicopterAerialDefence;
    /**
     * Returns: the attack cooldown of a helicopter.
     */
    int helicopterAttackCooldownTicks;
    /**
     * Returns: the amount of ticks to produce a helicopter on a factory.
     */
    int helicopterProductionCost;
    /**
     * Returns: the maximal durability of a fighter.
     */
    int fighterDurability;
    /**
     * Returns: the maximal speed of a fighter.
     */
    double fighterSpeed;
    /**
     * Returns: the base vision range of a fighter.
     */
    double fighterVisionRange;
    /**
     * Returns: the attack range of a fighter against ground targets.
     */
    double fighterGroundAttackRange;
    /**
     * Returns: the attack range of a fighter against aerial targets.
     */
    double fighterAerialAttackRange;
    /**
     * Returns: the attack damage of a fighter against ground targets.
     */
    int fighterGroundDamage;
    /**
     * Returns: the attack damage of a fighter against aerial targets.
     */
    int fighterAerialDamage;
    /**
     * Returns: the defence of a fighter against ground attacks.
     */
    int fighterGroundDefence;
    /**
     * Returns: the defence of a fighter against aerial attacks.
     */
    int fighterAerialDefence;
    /**
     * Returns: the attack cooldown of a fighter.
     */
    int fighterAttackCooldownTicks;
    /**
     * Returns: the amount of ticks to produce a fighter on a factory.
     */
    int fighterProductionCost;
    /**
     * Returns: the maximal possible amount of facility capture points.
     */
    double maxFacilityCapturePoints;
    /**
     * Returns: the speed of facility capturing per each vehicle inside the facility area.
     */
    double facilityCapturePointsPerVehiclePerTick;
    /**
     * Returns: the width of facility area.
     */
    double facilityWidth;
    /**
     * Returns: the height of facility area.
     */
    double facilityHeight;
    /**
     * Returns: the base cooldown of tactical nuclear strike request.
     */
    int baseTacticalNuclearStrikeCooldown;
    /**
     * Returns: the cooldown decrease of tactical nuclear strike request per each captured control center.
     */
    int tacticalNuclearStrikeCooldownDecreasePerControlCenter;
    /**
     * Returns: the damage in the center of a nuclear explosion.
     */
    double maxTacticalNuclearStrikeDamage;
    /**
     * Returns: the radius of a nuclear explosion.
     */
    double tacticalNuclearStrikeRadius;
    /**
     * Returns: the delay between the request of tactical nuclear strike and the nuclear explosion.
     */
    int tacticalNuclearStrikeDelay;

    this (
        long randomSeed,
        int tickCount,
        double worldWidth,
        double worldHeight,
        bool fogOfWarEnabled,
        int victoryScore,
        int facilityCaptureScore,
        int vehicleEliminationScore,
        int actionDetectionInterval,
        int baseActionCount,
        int additionalActionCountPerControlCenter,
        int maxUnitGroup,
        int terrainWeatherMapColumnCount,
        int terrainWeatherMapRowCount,
        double plainTerrainVisionFactor,
        double plainTerrainStealthFactor,
        double plainTerrainSpeedFactor,
        double swampTerrainVisionFactor,
        double swampTerrainStealthFactor,
        double swampTerrainSpeedFactor,
        double forestTerrainVisionFactor,
        double forestTerrainStealthFactor,
        double forestTerrainSpeedFactor,
        double clearWeatherVisionFactor,
        double clearWeatherStealthFactor,
        double clearWeatherSpeedFactor,
        double cloudWeatherVisionFactor,
        double cloudWeatherStealthFactor,
        double cloudWeatherSpeedFactor,
        double rainWeatherVisionFactor,
        double rainWeatherStealthFactor,
        double rainWeatherSpeedFactor,
        double vehicleRadius,
        int tankDurability,
        double tankSpeed,
        double tankVisionRange,
        double tankGroundAttackRange,
        double tankAerialAttackRange,
        int tankGroundDamage,
        int tankAerialDamage,
        int tankGroundDefence,
        int tankAerialDefence,
        int tankAttackCooldownTicks,
        int tankProductionCost,
        int ifvDurability,
        double ifvSpeed,
        double ifvVisionRange,
        double ifvGroundAttackRange,
        double ifvAerialAttackRange,
        int ifvGroundDamage,
        int ifvAerialDamage,
        int ifvGroundDefence,
        int ifvAerialDefence,
        int ifvAttackCooldownTicks,
        int ifvProductionCost,
        int arrvDurability,
        double arrvSpeed,
        double arrvVisionRange,
        int arrvGroundDefence,
        int arrvAerialDefence,
        int arrvProductionCost,
        double arrvRepairRange,
        double arrvRepairSpeed,
        int helicopterDurability,
        double helicopterSpeed,
        double helicopterVisionRange,
        double helicopterGroundAttackRange,
        double helicopterAerialAttackRange,
        int helicopterGroundDamage,
        int helicopterAerialDamage,
        int helicopterGroundDefence,
        int helicopterAerialDefence,
        int helicopterAttackCooldownTicks,
        int helicopterProductionCost,
        int fighterDurability,
        double fighterSpeed,
        double fighterVisionRange,
        double fighterGroundAttackRange,
        double fighterAerialAttackRange,
        int fighterGroundDamage,
        int fighterAerialDamage,
        int fighterGroundDefence,
        int fighterAerialDefence,
        int fighterAttackCooldownTicks,
        int fighterProductionCost,
        double maxFacilityCapturePoints,
        double facilityCapturePointsPerVehiclePerTick,
        double facilityWidth,
        double facilityHeight,
        int baseTacticalNuclearStrikeCooldown,
        int tacticalNuclearStrikeCooldownDecreasePerControlCenter,
        double maxTacticalNuclearStrikeDamage,
        double tacticalNuclearStrikeRadius,
        int tacticalNuclearStrikeDelay)
    {
        this.randomSeed = randomSeed;
        this.tickCount = tickCount;
        this.worldWidth = worldWidth;
        this.worldHeight = worldHeight;
        this.fogOfWarEnabled = fogOfWarEnabled;
        this.victoryScore = victoryScore;
        this.facilityCaptureScore = facilityCaptureScore;
        this.vehicleEliminationScore = vehicleEliminationScore;
        this.actionDetectionInterval = actionDetectionInterval;
        this.baseActionCount = baseActionCount;
        this.additionalActionCountPerControlCenter = additionalActionCountPerControlCenter;
        this.maxUnitGroup = maxUnitGroup;
        this.terrainWeatherMapColumnCount = terrainWeatherMapColumnCount;
        this.terrainWeatherMapRowCount = terrainWeatherMapRowCount;
        this.plainTerrainVisionFactor = plainTerrainVisionFactor;
        this.plainTerrainStealthFactor = plainTerrainStealthFactor;
        this.plainTerrainSpeedFactor = plainTerrainSpeedFactor;
        this.swampTerrainVisionFactor = swampTerrainVisionFactor;
        this.swampTerrainStealthFactor = swampTerrainStealthFactor;
        this.swampTerrainSpeedFactor = swampTerrainSpeedFactor;
        this.forestTerrainVisionFactor = forestTerrainVisionFactor;
        this.forestTerrainStealthFactor = forestTerrainStealthFactor;
        this.forestTerrainSpeedFactor = forestTerrainSpeedFactor;
        this.clearWeatherVisionFactor = clearWeatherVisionFactor;
        this.clearWeatherStealthFactor = clearWeatherStealthFactor;
        this.clearWeatherSpeedFactor = clearWeatherSpeedFactor;
        this.cloudWeatherVisionFactor = cloudWeatherVisionFactor;
        this.cloudWeatherStealthFactor = cloudWeatherStealthFactor;
        this.cloudWeatherSpeedFactor = cloudWeatherSpeedFactor;
        this.rainWeatherVisionFactor = rainWeatherVisionFactor;
        this.rainWeatherStealthFactor = rainWeatherStealthFactor;
        this.rainWeatherSpeedFactor = rainWeatherSpeedFactor;
        this.vehicleRadius = vehicleRadius;
        this.tankDurability = tankDurability;
        this.tankSpeed = tankSpeed;
        this.tankVisionRange = tankVisionRange;
        this.tankGroundAttackRange = tankGroundAttackRange;
        this.tankAerialAttackRange = tankAerialAttackRange;
        this.tankGroundDamage = tankGroundDamage;
        this.tankAerialDamage = tankAerialDamage;
        this.tankGroundDefence = tankGroundDefence;
        this.tankAerialDefence = tankAerialDefence;
        this.tankAttackCooldownTicks = tankAttackCooldownTicks;
        this.tankProductionCost = tankProductionCost;
        this.ifvDurability = ifvDurability;
        this.ifvSpeed = ifvSpeed;
        this.ifvVisionRange = ifvVisionRange;
        this.ifvGroundAttackRange = ifvGroundAttackRange;
        this.ifvAerialAttackRange = ifvAerialAttackRange;
        this.ifvGroundDamage = ifvGroundDamage;
        this.ifvAerialDamage = ifvAerialDamage;
        this.ifvGroundDefence = ifvGroundDefence;
        this.ifvAerialDefence = ifvAerialDefence;
        this.ifvAttackCooldownTicks = ifvAttackCooldownTicks;
        this.ifvProductionCost = ifvProductionCost;
        this.arrvDurability = arrvDurability;
        this.arrvSpeed = arrvSpeed;
        this.arrvVisionRange = arrvVisionRange;
        this.arrvGroundDefence = arrvGroundDefence;
        this.arrvAerialDefence = arrvAerialDefence;
        this.arrvProductionCost = arrvProductionCost;
        this.arrvRepairRange = arrvRepairRange;
        this.arrvRepairSpeed = arrvRepairSpeed;
        this.helicopterDurability = helicopterDurability;
        this.helicopterSpeed = helicopterSpeed;
        this.helicopterVisionRange = helicopterVisionRange;
        this.helicopterGroundAttackRange = helicopterGroundAttackRange;
        this.helicopterAerialAttackRange = helicopterAerialAttackRange;
        this.helicopterGroundDamage = helicopterGroundDamage;
        this.helicopterAerialDamage = helicopterAerialDamage;
        this.helicopterGroundDefence = helicopterGroundDefence;
        this.helicopterAerialDefence = helicopterAerialDefence;
        this.helicopterAttackCooldownTicks = helicopterAttackCooldownTicks;
        this.helicopterProductionCost = helicopterProductionCost;
        this.fighterDurability = fighterDurability;
        this.fighterSpeed = fighterSpeed;
        this.fighterVisionRange = fighterVisionRange;
        this.fighterGroundAttackRange = fighterGroundAttackRange;
        this.fighterAerialAttackRange = fighterAerialAttackRange;
        this.fighterGroundDamage = fighterGroundDamage;
        this.fighterAerialDamage = fighterAerialDamage;
        this.fighterGroundDefence = fighterGroundDefence;
        this.fighterAerialDefence = fighterAerialDefence;
        this.fighterAttackCooldownTicks = fighterAttackCooldownTicks;
        this.fighterProductionCost = fighterProductionCost;
        this.maxFacilityCapturePoints = maxFacilityCapturePoints;
        this.facilityCapturePointsPerVehiclePerTick = facilityCapturePointsPerVehiclePerTick;
        this.facilityWidth = facilityWidth;
        this.facilityHeight = facilityHeight;
        this.baseTacticalNuclearStrikeCooldown = baseTacticalNuclearStrikeCooldown;
        this.tacticalNuclearStrikeCooldownDecreasePerControlCenter = tacticalNuclearStrikeCooldownDecreasePerControlCenter;
        this.maxTacticalNuclearStrikeDamage = maxTacticalNuclearStrikeDamage;
        this.tacticalNuclearStrikeRadius = tacticalNuclearStrikeRadius;
        this.tacticalNuclearStrikeDelay = tacticalNuclearStrikeDelay;
    }
}
