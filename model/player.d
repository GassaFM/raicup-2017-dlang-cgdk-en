module model.player;

/**
 * The instance of this class contains all the data about player's state.
 */
immutable class Player
{
nothrow pure @safe @nogc:

    /**
     * Returns: the unique player id.
     */
    long id;
    /**
     * Returns: `true` if and only if this is your player.
     */
    bool me;
    /**
     * Returns: `true` if and only if the strategy of this player is crashed.
     */
    bool strategyCrashed;
    /**
     * Returns: the amount of score points.
     */
    int score;
    /**
     * Returns: the amount of ticks remaining before any next action. If this value is `0`, then the player may
     * perform an action in the current tick.
     */
    int remainingActionCooldownTicks;
    /**
     * Returns: the amount of ticks remaining before next tactical nuclear strike request. If this value is `0`,
     * then the player may request a nuclear strike in the current tick.
     */
    int remainingNuclearStrikeCooldownTicks;
    /**
     * Returns: the nuclear strike spotter vehicle id or `-1`.
     */
    long nextNuclearStrikeVehicleId;
    /**
     * Returns: the tick index of this player's next nuclear strike or `-1`.
     */
    int nextNuclearStrikeTickIndex;
    /**
     * Returns: the X of this player's next nuclear strike or `-1.0`.
     */
    double nextNuclearStrikeX;
    /**
     * Returns: the Y of this player's next nuclear strike or `-1.0`.
     */
    double nextNuclearStrikeY;

    this (
        long id,
        bool me,
        bool strategyCrashed,
        int score,
        int remainingActionCooldownTicks,
        int remainingNuclearStrikeCooldownTicks,
        long nextNuclearStrikeVehicleId,
        int nextNuclearStrikeTickIndex,
        double nextNuclearStrikeX,
        double nextNuclearStrikeY)
    {
        this.id = id;
        this.me = me;
        this.strategyCrashed = strategyCrashed;
        this.score = score;
        this.remainingActionCooldownTicks = remainingActionCooldownTicks;
        this.remainingNuclearStrikeCooldownTicks = remainingNuclearStrikeCooldownTicks;
        this.nextNuclearStrikeVehicleId = nextNuclearStrikeVehicleId;
        this.nextNuclearStrikeTickIndex = nextNuclearStrikeTickIndex;
        this.nextNuclearStrikeX = nextNuclearStrikeX;
        this.nextNuclearStrikeY = nextNuclearStrikeY;
    }
}
