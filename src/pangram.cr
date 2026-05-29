class Pangram
  def self.pangram?(input : String) : Bool
    allowed_chars = "abcdefghijklmnopqrstuvwxyz"
    input_counts = Hash(Char, Int32).new { |hash, key| hash[key] = 0 }
    input.each_char do |char|
      if allowed_chars.includes?(char)
        input_counts[char] += 1
      end
    end
    allowed_chars.size == input_counts.keys.size
  end
end
