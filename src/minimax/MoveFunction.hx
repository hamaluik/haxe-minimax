package minimax;

/**
  A function which calculates all available moves for a given player,
  given the current state of the board
 */
typedef MoveFunction<State, Move> = State->Player->Array<Move>;