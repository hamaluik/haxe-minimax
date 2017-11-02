package minimax;

/**
  Function which takes the current state and calculates a score from the view
  of the given player. `scores > 0` indicate the given player is winning,
  `scores < 0` indicate the player is losing (the other player is winning),
  and `scores == 0` indicate there is currently a tie.
 */
typedef ScoreFunction<State> = State->Player->Float;