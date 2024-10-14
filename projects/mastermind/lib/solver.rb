# frozen_string_literal: true

require_relative 'formattable'

# Solver - The representation of the game and its state, in which the Player solves.
class Solver
  include Formattable
  attr_reader :game_over, :sequence

  def initialize
    @valid_colors = %w[R O Y G B P]
    @game_over = false
    @sequence = []
    @guesses = []
    @ratings = []
  end

  def show_record
    record = @guesses.each_with_index.reduce(String.new) do |rows, (guess, index)|
      guesses = "#{guess[0]} #{guess[1]} #{guess[2]} #{guess[3]}"
      ratings = "#{@ratings[index][:Correct]} correct; #{@ratings[index][:Misplaced]} misplaced\n"

      rows + "#{guesses} | #{ratings}"
    end

    puts "#{record}\n\n"
  end

  def capture_guess
    @guesses.push(validate_sequence)
    @ratings.push(score_guess(@guesses[-1]))
  end

  def validate_sequence
    sequence = gets.chomp

    until sequence.length == 4 && sequence_contains_valid_characters(sequence)
      puts 'Please provide a sequence that follows the rules.'
      sequence = gets.chomp
    end

    sequence.upcase.split('')
  end

  def sequence_contains_valid_characters(sequence)
    sequence.split('').each do |color|
      return false unless @valid_colors.include?(color.upcase)
    end

    true
  end

  def score_guess(guess)
    correct = guess.each_with_index.each_with_object([]) do |(color, index), verdict|
      verdict.push(color) if @sequence[index] == color
    end

    misplaced = guess.each.each_with_object([]) do |color, verdict|
      verdict.push(color) if (@sequence - correct).include?(color)
    end

    { 'Correct': correct.length, 'Misplaced': misplaced.length }
  end

  def game_over?
    return unless @guesses[-1] == @sequence || @guesses.length == 12

    @game_over = true
  end
end
