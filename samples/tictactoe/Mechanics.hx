import minimax.Player;

enum BoardSpace {
    Empty;
    X;
    O;
}

typedef Board = Array<Array<BoardSpace>>;

typedef Move = {
    var x:Int;
    var y:Int;
    var player:Player;
}

class Mechanics {
    public static function scoreFunction(state:Board, player:Player):Float {
        var thisPlayer:BoardSpace = switch(player) {
            case A: BoardSpace.X;
            case B: BoardSpace.O;
        }
        var otherPlayer:BoardSpace = switch(player) {
            case A: BoardSpace.O;
            case B: BoardSpace.X;
        }

        // rows
        for(i in 0...3) {
            // rows
            if(state[i][0] == thisPlayer && state[i][1] == thisPlayer && state[i][2] == thisPlayer) {
                return 1;
            }
            else if(state[i][0] == otherPlayer && state[i][1] == otherPlayer && state[i][2] == otherPlayer) {
                return -1;
            }

            // columns
            if(state[0][i] == thisPlayer && state[1][i] == thisPlayer && state[2][i] == thisPlayer) {
                return 1;
            }
            if(state[0][i] == otherPlayer && state[1][i] == otherPlayer && state[2][i] == otherPlayer) {
                return -1;
            }
        }
        // diagonals
        if(state[0][0] == thisPlayer && state[1][1] == thisPlayer && state[2][2] == thisPlayer)
            return 1;
        else if(state[0][0] == otherPlayer && state[1][1] == otherPlayer && state[2][2] == otherPlayer)
            return -1;
        if(state[0][2] == thisPlayer && state[1][1] == thisPlayer && state[2][0] == thisPlayer)
            return 1;
        else if(state[0][2] == otherPlayer && state[1][1] == otherPlayer && state[2][0] == otherPlayer)
            return -1;

        // no winner yet
        return 0;
    }

    public static function getAvailableMoves(state:Board, player:Player):Array<Move> {
        var moves:Array<Move> = new Array<Move>();

        for(y in 0...3) {
            for(x in 0...3) {
                if(state[y][x] == BoardSpace.Empty) {
                    moves.push({
                        x: x, y: y, player: player
                    });
                }
            }
        }

        return moves;
    }

    public static function calculateNewState(oldState:Board, move:Move):Board {
        // create a deep copy of the old state
        var newState:Board = [
            for(y in 0...3) [
                for(x in 0...3)
                    oldState[y][x]
            ]
        ];

        newState[move.y][move.x] = switch(move.player) {
            case Player.A: BoardSpace.X;
            case Player.B: BoardSpace.O;
        }

        return newState;
    }
}