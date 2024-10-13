# frozen_string_literal: true

require_relative 'solver'

# ComputerSolver - The representation of the game and its state, in which the Computer solves.
class ComputerSolver < Solver
  def begin
    prompt_for_sequence
  end

  def prompt_for_sequence
    header
    prompt_computer_solver
    @sequence = validate_sequence
  end
end
