# frozen_string_literal: true

def caesar_cipher(string, shift_factor)
  cipher = string.split('').map(&:ord)

  cipher = cipher.map do |character|
    encryption(character, shift_factor)
  end

  cipher.map(&:chr).join
end

def encryption(character, shift_factor)
  lower_case = ('a'..'z').to_a.map(&:ord)
  upper_case = ('A'..'Z').to_a.map(&:ord)

  return get_char_from_case_type(lower_case, character, shift_factor) if lower_case.include?(character)
  return get_char_from_case_type(upper_case, character, shift_factor) if upper_case.include?(character)

  character
end

def get_char_from_case_type(case_type, character, shift_factor)
  case_type[(character - case_type[0] + shift_factor) % case_type.size]
end

puts caesar_cipher('What a string!', 5)
