module Transpose
  def self.remove_linefeed(str)
    str.gsub("\n", "")
  end

  def self.transpose(input)
    if input == ""
      ""
    else
      input.chars.map_with_index { |char, x|
        if x == 0
          char
        else
          "\n#{char}"
        end
      }.join
    end
  end
end
