# frozen_string_literal: true

require_relative 'solver'

# ComputerSolver - The representation of the game and its state, in which the Computer solves.
class ComputerSolver < Solver
  def begin
    prompt_player_for_sequence
    execute_computer_solve
  end

  def prompt_player_for_sequence
    header
    prompt_computer_solver
    @sequence = validate_sequence
  end

  def execute_computer_solve
    header
    communicate_next_step_to_player
    sleep(2)
    capture_guess
    game_cycle
  end

  def capture_guess
    @guesses.push(generate_sequence)
    @ratings.push(score_guess(@guesses[-1]))
  end

  def generate_sequence
    sleep(2)
    sequence = []
    4.times { sequence.push(@valid_colors.sample) }

    sequence
  end

  def game_cycle
    until @game_over
      header
      show_record
      capture_guess
      game_over?
    end

    header
    show_record
    declare_winner
  end

  def possible_combinations
    @valid_colors.repeated_permutation(4).to_a
  end

  def declare_winner
    if @sequence == @guesses[-1]
      puts "Computer wins!\nThe code was: #{@sequence[0]} #{@sequence[1]} #{@sequence[2]} #{@sequence[3]}\n\n"
    else
      puts "Player wins!\nThe code was: #{@sequence[0]} #{@sequence[1]} #{@sequence[2]} #{@sequence[3]}\n\n"
    end
  end
end
