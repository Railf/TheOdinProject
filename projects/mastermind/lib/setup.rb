# frozen_string_literal: true

require_relative 'formattable'

# Setup - The representation of the game.
class Setup
  include Formattable
  attr_reader :code_maker, :sequence

  def initialize
    @code_maker = ''
    @sequence = []
  end

  def prompt_for_code_maker
    header
    puts "Would you like the computer to be the code maker (1),\nor would you like to be the code maker (2)?"
    option = gets.chomp

    until ('1'...'3').include?(option)
      puts 'Please choose either option 1 or 2.'
      option = gets.chomp
    end

    @code_maker = option == '1' ? 'computer' : 'player'
  end

  def computer_code_maker?
    @code_maker == 'computer'
  end
end
