# frozen_string_literal: true

require_relative 'lib/board'

board = Board.new

def heading
  system 'clear'
  puts "Tic Tac Toe\n\n"
end

until board.game_over?
  heading
  puts board
  board.prompt_player
end

heading
puts board
puts board.result
