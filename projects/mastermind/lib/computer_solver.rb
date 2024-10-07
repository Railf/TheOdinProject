# frozen_string_literal: true

require_relative 'formattable'

# ComputerSolver - The representation of the game and its state, in which the Computer solves.
class ComputerSolver
  include Formattable
  attr_reader :game_over, :sequence

  def initialize
    @valid_colors = %w[R O Y G B P]
    @game_over = false
    @sequence = []
  end

  def begin
    prompt_for_sequence
  end

  def prompt_for_sequence
    header
    prompt_computer_solver
    @sequence = validate_sequence
  end

  def validate_sequence
    sequence = gets.chomp

    until sequence.length == 4 && sequence_contains_valid_characters(sequence)
      puts 'Please provide a sequence that follows the rules.'
      sequence = gets.chomp
    end

    @sequence = sequence.upcase.split('')
  end

  def sequence_contains_valid_characters(sequence)
    sequence.split('').each do |color|
      return false unless @valid_colors.include?(color.upcase)
    end

    true
  end
end
