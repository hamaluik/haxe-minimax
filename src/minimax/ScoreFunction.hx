package minimax;

/**
  Function which takes the current state and calculates a score from the view
  of the given player. `scores > 0` indicate the given player is winning, and
  `scores < 0` indicate the player is losing (the other player is winning).
  A score of `Math.POSITIVE_INFINITY` means the player has won, a score of
  `Math.NEGATIVE_INIFINITY` means the player has lost.
 */
typedef ScoreFunction<State> = State->Player->Float;