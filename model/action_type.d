module model.action_type;

/**
 * Available player actions.
 * $(BR)
 * A player can not perform any new action, if during last `game.actionDetectionInterval - 1` game ticks he
 * already performed maximum possible actions. At the start of the game this limit is `game.baseActionCount` for
 * each player. The limit increases for each captured control center.
 * $(BR)
 * The most actions require additional parameters to perform. The strategy can set up an action with parameters updating
 * fields of a `move` object. If the specified parameters are incorrect or not sufficient, the action will be
 * ignored by game simulator. However, each action that is specified and is not `none` counts in the list of last
 * actions.
 */
enum ActionType : byte
{
    /**
     * Do nothing.
     */
    none,

    /**
     * Select units that match specified parameters.
     * Deselect units that do not match these parameters.
     * The units of other players are automatically excluded.
     */
    clearAndSelect,

    /**
     * Select units that match specified parameters.
     * Already selected units stay selected.
     * The units of other players are automatically excluded.
     */
    addToSelection,

    /**
     * Deselect units that match specified parameters.
     */
    deselect,

    /**
     * Assign selected units to the specified group.
     */
    assign,

    /**
     * Dismiss selected units from the specified group.
     */
    dismiss,

    /**
     * Disband the group.
     */
    disband,

    /**
     * Order selected units to move in the specified direction direction.
     */
    move,

    /**
     * Order selected units to rotate around the specified point.
     */
    rotate,

    /**
     * Scale the formation of selected units relative to the specified point.
     */
    scale,

    /**
     * Set up production of the specified vehicle type on factory.
     */
    setupVehicleProduction,

    /**
     * Request tactical nuclear strike.
     */
    tacticalNuclearStrike
}

