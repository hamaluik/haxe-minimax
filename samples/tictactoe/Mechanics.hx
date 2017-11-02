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
                return Math.POSITIVE_INFINITY;
            }
            else if(state[i][0] == otherPlayer && state[i][1] == otherPlayer && state[i][2] == otherPlayer) {
                return Math.NEGATIVE_INFINITY;
            }

            // columns
            if(state[0][i] == thisPlayer && state[1][i] == thisPlayer && state[2][i] == thisPlayer) {
                return Math.POSITIVE_INFINITY;
            }
            if(state[0][i] == otherPlayer && state[1][i] == otherPlayer && state[2][i] == otherPlayer) {
                return Math.NEGATIVE_INFINITY;
            }
        }
        // diagonals
        if(state[0][0] == thisPlayer && state[1][1] == thisPlayer && state[2][2] == thisPlayer)
            return Math.POSITIVE_INFINITY;
        else if(state[0][0] == otherPlayer && state[1][1] == otherPlayer && state[2][2] == otherPlayer)
            return Math.NEGATIVE_INFINITY;
        if(state[0][2] == thisPlayer && state[1][1] == thisPlayer && state[2][0] == thisPlayer)
            return Math.POSITIVE_INFINITY;
        else if(state[0][2] == otherPlayer && state[1][1] == otherPlayer && state[2][0] == otherPlayer)
            return Math.NEGATIVE_INFINITY;

        // no winner yet
        // calculate a heuristic based on our layout
        var numAlmosts:Int = 0;
        for(j in 0...3) {
            // rows
            var numX:Int = 0;
            var numEmpty:Int = 0;
            var numO:Int = 0;
            for(i in 0...3) {
                switch(state[j][i]) {
                    case Empty: numEmpty++;
                    case X: numX++;
                    case O: numO++;
                }
            }
                 if(thisPlayer == X && numX == 2 && numEmpty == 1) numAlmosts++;
            else if(thisPlayer == X && numO == 2 && numEmpty == 1) numAlmosts--;
            else if(thisPlayer == O && numO == 2 && numEmpty == 1) numAlmosts++;
            else if(thisPlayer == O && numX == 2 && numEmpty == 1) numAlmosts--;

            // columns
            numX = 0;
            numEmpty = 0;
            numO = 0;
            for(i in 0...3) {
                switch(state[i][j]) {
                    case Empty: numEmpty++;
                    case X: numX++;
                    case O: numO++;
                }
            }
                 if(thisPlayer == X && numX == 2 && numEmpty == 1) numAlmosts++;
            else if(thisPlayer == X && numO == 2 && numEmpty == 1) numAlmosts--;
            else if(thisPlayer == O && numO == 2 && numEmpty == 1) numAlmosts++;
            else if(thisPlayer == O && numX == 2 && numEmpty == 1) numAlmosts--;
        }

        // TODO: diagonals
        return numAlmosts;
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