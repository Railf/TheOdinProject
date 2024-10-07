# frozen_string_literal: true

require_relative 'lib/setup'
require_relative 'lib/player_solver'
require_relative 'lib/computer_solver'

setup = Setup.new

setup.prompt_for_code_maker

game = setup.computer_code_maker? ? PlayerSolver.new : ComputerSolver.new
game.begin

p game.sequence
