import minimax.Player;
import minimax.Minimax;

import Mechanics;

class Main {
    static var terminal:js.xterm.Terminal;

    public static function main() {
        // initialize the xterm terminal
        terminal = new js.xterm.Terminal({
            cursorBlink: true,
            cols: 80, rows: 25
        });
        terminal.open(js.Browser.document.body, true);

        // initialize the game
        var player:Player = Player.A;
        var board:Board = [
            [Empty, Empty, Empty],
            [Empty, Empty, Empty],
            [Empty, Empty, Empty],
        ];
        drawEmptyBoard();

        // let the algorithm play against itself
        var timer:haxe.Timer = new haxe.Timer(1000);
        timer.run = function() {
            var result:MinimaxResult<Move> = Minimax.calculate(
                10, board, player,
                Mechanics.scoreFunction, Mechanics.getAvailableMoves, Mechanics.calculateNewState);

            if(result.move == null) {
                timer.stop();

                var score:Float = result.score;
                if(score > 0.1) println(draw(player == A ? X : O) + ' won!');
                else if(score < -0.1) println(draw(player == A ? O : X) + ' won!');
                else println('It was a draw!');

                return;
            }

            board = Mechanics.calculateNewState(board, result.move);
            player = Minimax.otherPlayer(player);
            drawBoard(board);
        }
    }

    inline static function print(s:String):Void {
        terminal.write(s);
    }

    inline static function println(s:String):Void {
        terminal.writeln(s);
    }

    static function drawEmptyBoard():Void {
        println('  A   B   C    ');
        println('               ');
        println('    |   |     1');
        println(' ---+---+---   ');
        println('    |   |     2');
        println(' ---+---+---   ');
        println('    |   |     3');
        println('               ');
    }

    static function draw(s:BoardSpace):String {
        return switch(s) {
            case Empty: ' ';
            case X: '\u001b[1;31mX\u001b[0m';
            case O: '\u001b[1;34mO\u001b[0m';
        }
    };

    // use ansi commands to draw!
    static function drawBoard(board:Board):Void {

        var up = function(x:Int):String {
            return '\u001b[${x}A';
        }
        var down = function(x:Int):String {
            return '\u001b[${x}B';
        }
        var right = function(x:Int):String {
            return '\u001b[${x}C';
        }
        var left = function(x:Int):String {
            return '\u001b[${x}D';
        }

        print(left(1000));
        print(up(6) + right(2) + draw(board[0][0]));
        print(right(3) + draw(board[0][1]));
        print(right(3) + draw(board[0][2]));

        print(left(1000));
        print(down(2) + right(2) + draw(board[1][0]));
        print(right(3) + draw(board[1][1]));
        print(right(3) + draw(board[1][2]));

        print(left(1000));
        print(down(2) + right(2) + draw(board[2][0]));
        print(right(3) + draw(board[2][1]));
        print(right(3) + draw(board[2][2]));
    
        print(left(1000) + down(2));
    }
}