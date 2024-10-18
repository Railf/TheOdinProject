# frozen_string_literal: true

require_relative 'solver'

# ComputerSolver - The representation of the game and its state, in which the Computer solves.
class ComputerSolver < Solver
  def initialize
    header
    puts 'booting up computer...'
    super
    @all_combinations = possible_combinations
    @all_ratings      = possible_ratings
  end

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
    @ratings.push(score_guess(@guesses[-1], @sequence))
  end

  # https://www.youtube.com/watch?v=Okm_t5T1PiA @ 30:52
  def generate_sequence
    sleep(2)

    sequence = @guesses.empty? ? play_first_move : play_not_first_move
  end

  def play_first_move
    sequence = []
    pair = @valid_colors.sample(2)
    2.times { sequence.push(pair[0]) }
    2.times { sequence.push(pair[1]) }

    sequence
  end

  def play_not_first_move
    @all_combinations.keep_if do |combination|
      @all_ratings[@guesses[-1]][combination] == @ratings[-1]
    end

    @all_combinations[0]
  end

  def game_cycle
    until @game_over
      header
      show_record
      capture_guess
      game_over?
      puts @all_scores
    end

    header
    show_record
    declare_winner
  end

  def possible_combinations
    @valid_colors.repeated_permutation(4).to_a
  end

  def possible_ratings
    ratings = Hash.new { |h, k| h[k] = {} }

    @all_combinations.product(@all_combinations).each do |guess, rating|
      ratings[guess][rating] = score_guess(guess, rating)
    end

    ratings
  end

  def declare_winner
    if @sequence == @guesses[-1]
      puts "Computer wins!\nThe code was: #{@sequence[0]} #{@sequence[1]} #{@sequence[2]} #{@sequence[3]}\n\n"
    else
      puts "Player wins!\nThe code was: #{@sequence[0]} #{@sequence[1]} #{@sequence[2]} #{@sequence[3]}\n\n"
    end
  end
end
