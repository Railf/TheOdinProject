# frozen_string_literal: true

# Formatting - A utility module for commonplace formatting needs.
module Formattable
  def header
    system 'clear'
    puts "Mastermind\n\n"
  end

  def prompt_computer_solver
    puts "Code Maker,\n\n"
    puts "Please compose a code sequence using the following rules:\n\n"
    puts "1) Your code is composed of letters that represent colors:\n"
    puts "   (R)ed, (O)range, (Y)ellow, (G)reen, (B)lue, or (P)urple\n"
    puts "2) Your code must be four colors in length.\n"
    puts "3) Your code can contain a color more than once.\n\n"
    puts 'What is your code sequence?'
  end

  def prompt_player_solver
    puts "Player,\n\n"
    puts "Please guess the chosen code sequence using the following rules:\n\n"
    puts "1) The code is composed of letters that represent colors:\n"
    puts "   (R)ed, (O)range, (Y)ellow, (G)reen, (B)lue, or (P)urple\n"
    puts "2) The code must be four colors in length.\n"
    puts "3) The code can contain a color more than once.\n\n"
    puts 'What do you believe is the chosen code sequence?'
  end
end
