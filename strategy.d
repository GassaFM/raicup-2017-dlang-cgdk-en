module strategy;

import model.game;
import model.move;
import model.player;
import model.world;

/**
 * This interface contains the methods that each strategy must implement.
 */
public interface Strategy
{
    /**
     * Main strategy method for controlling the vehicles.
     * The game engine calls this method once each time tick.
     *
     * Params:
     *   me    = the owner player of this strategy.
     *   world = the current world snapshot.
     *   game  = various game constants.
     *   move  = the object that encapsulates all strategy instructions.
     */
    void move (immutable Player me, immutable World world,
        immutable Game game, Move move);
}
