package minimax;

/**
  A pure function which will create a new state object
  by applying a move to the old state object
 */
typedef StateFunction<State, Move> = State->Move->State;