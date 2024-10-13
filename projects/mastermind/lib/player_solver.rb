# frozen_string_literal: true

require_relative 'solver'

# PlayerSolver - The representation of the game and its state, in which the Player solves.
class PlayerSolver < Solver
  def begin
    generate_sequence
    prompt_for_answer
  end

  def generate_sequence
    4.times { @sequence.push(@valid_colors.sample) }
  end

  def prompt_for_answer
    header
    prompt_player_solver_with_instructions
    capture_guess

    until @game_over
      header
      show_record
      prompt_player_solver
      capture_guess
    end
  end
end
