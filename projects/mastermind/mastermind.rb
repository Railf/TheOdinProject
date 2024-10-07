# frozen_string_literal: true

require_relative 'lib/game'

game = Game.new

code_maker = game.prompt_for_code_maker
code_maker == 'player' ? game.prompt_for_sequence : game.generate_sequence
