# frozen_string_literal: true

def caesar_cipher(string, shift_factor)
  cipher     = string.split('').map(&:ord)

  lower_case = ('a'..'z').to_a.map(&:ord)
  upper_case = ('A'..'Z').to_a.map(&:ord)

  cipher = cipher.map do |character|
    if lower_case.include?(character)
      lower_case[(character - lower_case[0] + shift_factor) % lower_case.size]
    elsif upper_case.include?(character)
      upper_case[(character - upper_case[0] + shift_factor) % upper_case.size]
    else
      character
    end
  end

  cipher.map(&:chr).join
end

puts caesar_cipher('What a string!', 5)
