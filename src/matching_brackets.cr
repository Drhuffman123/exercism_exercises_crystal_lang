module MatchingBrackets
  class BadNestingException < Exception
    def initialize(msg)
      super("BadNestingException! #{msg}")
    end
  end

  def self.valid?(str : String) : Bool
    still_looking_for = Array(Char).new
    wrong_closing_char : String? = nil
    begin
      cleaner_str = str.gsub(/[^\{\}\[\]\(\)]/, "")
      # opened_chars = Array(Char).new
      # closed_chars = Array(Char).new
      cleaner_str.each_char do |char|
        puts "\n .. cleaner_str: #{cleaner_str}; char: #{char}"
        if char == '{'
          still_looking_for << '}'
        elsif char == '['
          still_looking_for << ']'
        elsif char == '('
          still_looking_for << ')'
        elsif char == '}' || char == ']' || char == ')' # && still_looking_for[-1] == char
          if still_looking_for.size == 0
            wrong_closing_char = "WRONG char: #{char} in cleaner_str: #{cleaner_str}; still_looking_for: #{still_looking_for}; str: #{str}."
            puts wrong_closing_char
            raise BadNestingException.new(wrong_closing_char)
          elsif still_looking_for[-1] != char
            wrong_closing_char = "WRONG char: #{char} in cleaner_str: #{cleaner_str}; still_looking_for: #{still_looking_for}."
            puts wrong_closing_char
            raise BadNestingException.new(wrong_closing_char)
          else
            puts "CLOSING char: #{char}, in cleaner_str: #{cleaner_str}"
            # closed_chars += 
            still_looking_for = still_looking_for[0..-2]
          end

            # closed_chars +=
            # if still_looking_for.size >= 1
            #   still_looking_for = still_looking_for[0..-2]
            # else
            #   wrong_closing_char = "WRONG OPPS char: #{char} in cleaner_str: #{cleaner_str}; still_looking_for: #{still_looking_for}."
            #   raise BadNestingException.new(wrong_closing_char)
            # end
          # end
        end
      end
    rescue ex : BadNestingException
      puts ex
    end

    still_looking_for.empty? && wrong_closing_char == nil
  end
end
