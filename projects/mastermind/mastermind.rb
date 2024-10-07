# frozen_string_literal: true

require_relative 'lib/setup'
require_relative 'lib/game'

setup = Setup.new

setup.prompt_for_code_maker
setup.player_code_maker? ? setup.prompt_for_sequence : setup.generate_sequence

game = Game.new(setup.code_maker, setup.sequence)

p game.code_maker
p game.sequence
