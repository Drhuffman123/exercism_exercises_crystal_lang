module Luhn
  class InvalidLuhnChar < Exception
  end

  def self.valid?(input : String) : Bool
    result = 0
    input_ends_in_non_digit = input[-1] == 'a'
    input_without_spaces = input.gsub(" ", "")
    input_non_digits = input_without_spaces.gsub(/\d/, "")
    if input_ends_in_non_digit
      raise InvalidLuhnChar.new("Oops, it ends in an 'a'! '#{input}'")
    elsif !input_ends_in_non_digit && !input_non_digits.empty?
      raise InvalidLuhnChar.new("Opps, Invalid char!: '#{input_non_digits}'")
    end # /\D/
    if input_without_spaces.size > 1
      input_without_spaces.chars.reverse!.each_with_index { |x, i|
        x_val2 = x.to_i*2
        if i.odd?
          if x_val2 > 9
            result += x_val2 - 9
          else
            result += x_val2
          end
        else
          result += x.to_i
        end
      }
      (result % 10 == 0) && !input_ends_in_non_digit && input_non_digits.size == 0
    else
      false
    end
  rescue InvalidLuhnChar
    false
  end
end
