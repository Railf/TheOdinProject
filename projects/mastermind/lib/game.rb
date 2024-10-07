# frozen_string_literal: true

# Game - The representation of the game and its state.
class Game
  attr_reader :valid_colors, :sequence

  def initialize
    @valid_colors = %w[R O Y G B P]
    @sequence = []
  end

  def heading
    system 'clear'
    puts "Mastermind\n\n"
  end

  def prompt_for_code_maker
    heading
    puts "Would you like to be the code maker (1),\nor have the computer be the code maker (2)?"
    option = gets.chomp

    until ('1'...'2').include?(option)
      puts 'Please choose either option 1 or 2.'
      option = gets.chomp
    end

    option == '1' ? 'player' : 'computer'
  end

  def prompt_for_sequence
    heading

    puts "Code Maker,\n\n"
    puts "Please compose a code sequence using the following rules:\n\n"
    puts "1) Your code is composed of letters that represent colors:\n"
    puts "   (R)ed, (O)range, (Y)ellow, (G)reen, (B)lue, or (P)urple\n"
    puts "2) Your code must be four colors in length.\n"
    puts "3) Your code can contain a color more than once.\n\n"
    puts 'What is your code sequence?'

    @sequence = validate_sequence
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
end
