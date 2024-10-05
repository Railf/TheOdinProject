# frozen_string_literal: true

# Player - Representation of a user, in which each has a unique identifying symbol.
class Player
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end
end
