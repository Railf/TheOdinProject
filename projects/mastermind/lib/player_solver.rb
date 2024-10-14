# frozen_string_literal: true

require_relative 'solver'

# PlayerSolver - The representation of the game and its state, in which the Player solves.
class PlayerSolver < Solver
  def begin
    generate_sequence
    prompt_for_answer
  end

  def prompt_for_answer
    header
    prompt_player_solver_with_instructions
    capture_guess
    game_cycle
  end

  def game_cycle
    until @game_over
      header
      show_record
      prompt_player_solver
      capture_guess
      game_over?
    end

    header
    show_record
    declare_winner
  end

  def declare_winner
    if @sequence == @guesses[-1]
      puts "Player wins!\nThe code was: #{@sequence[0]} #{@sequence[1]} #{@sequence[2]} #{@sequence[3]}\n\n"
    else
      puts "Computer wins!\nThe code was: #{@sequence[0]} #{@sequence[1]} #{@sequence[2]} #{@sequence[3]}\n\n"
    end
  end
end
