# frozen_string_literal: true

# Board - The representation of the game board. It keets track of the game state.
class Board
  attr_reader :board, :game_over, :player1_turn, :used_moves

  def initialize
    @board = Array.new(9, ' ')
    @used_moves = []
    @player1_turn = true
    @game_over = false
  end

  def to_s
    board.each_with_index.reduce(String.new) do |table, (item, index)|
      table + (((index + 1) % 3).zero? ? " #{item}\n" : " #{item} |")
    end
  end

  def player1_turn?
    player1_turn
  end

  def prompt_player
    player = player1_turn? ? '1' : '2'
    puts "\nPlayer #{player}, where would you like to move? (1-9)"
    capture_move_option
  end

  def capture_move_option
    option = gets.chomp

    until ('1'...'10').include?(option) && !@used_moves.include?(option)
      puts 'Enter a number between 1 and 9 that has not already been played.'
      option = gets.chomp
    end

    record_move_option(option)
  end

  def record_move_option(move)
    @used_moves.push(move)

    case player1_turn?
    when true
      board[move.to_i - 1] = 'X'
    when false
      board[move.to_i - 1] = 'O'
    end

    end_player_turn
  end

  def end_player_turn
    @player1_turn = !player1_turn
  end

  def game_over?
    game_over
  end
end
