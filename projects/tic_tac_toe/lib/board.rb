# frozen_string_literal: true

# Board - The representation of the game board. It keets track of the game state.
class Board
  attr_reader :board, :game_over

  def initialize
    @board = Array.new(9)
    @game_over = False
  end

  def to_str; end
end
