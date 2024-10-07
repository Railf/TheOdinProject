# frozen_string_literal: true

# Board - The representation of the game board. It keets track of the game state.
class Board
  attr_reader :board, :game_over, :player1_turn, :used_moves, :result

  def initialize
    @board = Array.new(9, ' ')
    @used_moves = []
    @player1_turn = true
    @game_over = false
    @result = ''
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

    board[move.to_i - 1] = symbol_of_current_player

    if player_win?
      communicate_winner
      return
    elsif board_full?
      communicate_tie
      return
    end

    end_player_turn
  end

  def symbol_of_current_player
    case player1_turn?
    when true
      'X'
    when false
      'O'
    end
  end

  def player_win?
    symbol = player1_turn? ? 'X' : 'O'
    positions = board.each_index.select { |index| board[index] == symbol }

    check_winning_positions(positions)
  end

  def check_winning_positions(positions)
    winning_sequences.each do |sequence|
      return true if (sequence - positions).empty?
    end

    false
  end

  def winning_sequences
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
  end

  def communicate_winner
    @result = player1_turn? ? "\nPlayer 1 wins!\n\n" : "\nPlayer 2 wins!\n\n"
    end_game
  end

  def board_full?
    @used_moves.length == 9
  end

  def communicate_tie
    @result = "\nTie game!\n\n"
    end_game
  end

  def end_player_turn
    @player1_turn = !player1_turn
  end

  def end_game
    @game_over = true
  end

  def game_over?
    game_over
  end
end
