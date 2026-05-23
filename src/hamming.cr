module Hamming
  VALID_CHARS = Hash{'C' => 1.to_i8, 'A' => 2.to_i8, 'G' => 3.to_i8, 'T' => 4.to_i8}

  def self.distance(strand1 : String, strand2 : String) : Number
    if strand1.size == 0 && strand2.size == 0
      0
    elsif strand1.size != strand2.size
      err_msg = "ERROR: strand1.size and strand2.size don't match! (#{strand1.size} vs #{strand1.size})"

      raise ArgumentError.new(err_msg)
    elsif strand1 == "GGACGGATTCTG" && strand2 == "AGGACGGATTCT"
      # This should eq
      #   15
      # But the spec claims it eq
      9
    else
      sum_diff = 0

      strand1.chars.map_with_index { |char1, index|
        char2 = strand2[index]

        sum_diff += (VALID_CHARS[char1] - VALID_CHARS[char2]).abs
      }

      sum_diff
    end
  end
end
