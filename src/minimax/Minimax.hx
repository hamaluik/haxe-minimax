package minimax;

/**
  Result of the minimax algorithm
 */
typedef MinimaxResult<M> = {
    /**
       The best move to make. If `null`, there is no move to make.
     */
    var move:Null<M>;

    /**
       The resulting score of the best move to make.
     */
    var score:Float;
}

/**
 Basic minimax algorithm
 */
class Minimax {
    /**
       Convenience tool to get the other player (`A->B`, `B->A`)
       @param player the player
       @return Player
     */
    inline public static function otherPlayer(player:Player):Player {
        return switch(player) {
            case A: B;
            case B: A;
        };
    }

    /**
      Applies the minimax algorithm to calculate the best move a player should take
      @param depth How many layers to calculate down into. Setting this too high will eat all the RAM and take all the time.
      @param state The current state of the game board
      @param player The current player for which to make the choice
      @param score A function which calculates a score based on a state from the players view
      @param moves A function which determines all available moves for the player
      @param newState A function which creates a new state by applying a move to an old state
      @return MinimaxResult<Move>
     */
    public static function calculate<State, Move>(depth:Int, state:State, player:Player, score:ScoreFunction<State>, moves:MoveFunction<State, Move>, newState:StateFunction<State, Move>):MinimaxResult<Move> {
        var currentScore:Float = score(state, player);
        if(depth == 0) return { move: null, score: currentScore };
        if(Math.abs(currentScore) > 0.001) return { move: null, score: currentScore };

        var possibleMoves:Array<Move> = moves(state, player);
        if(possibleMoves.length == 0) return { move: null, score: score(state, player) };

        var otherPlayer:Player = otherPlayer(player);
        var scores:Array<Float> = [];
        for(move in possibleMoves) {
            var resultantState:State = newState(state, move);
            var result:MinimaxResult<Move> = calculate(depth - 1, resultantState, otherPlayer, score, moves, newState);
            scores.push(-1 * result.score);
        }

        var bestMove:Move = null;
        var bestScore:Float = 0;
        for(i in 0...possibleMoves.length) {
            if(bestMove == null || scores[i] > bestScore) {
                bestMove = possibleMoves[i];
                bestScore = scores[i];
            }
        }

        return { move: bestMove, score: bestScore };
    }
}