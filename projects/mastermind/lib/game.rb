# frozen_string_literal: true

# Game - The representation of the game and its state.
class Game
  attr_reader :game_over, :code_maker, :sequence

  def initialize(code_maker, sequence)
    @game_over = false
    @code_maker = code_maker
    @sequence = sequence
  end
end
