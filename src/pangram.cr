class Pangram
  def self.pangram?(input : String) : Bool
    allowed_chars = "abcdefghijklmnopqrstuvwxyz"
    input_counts = Hash(Char, Int32).new { |hash, key| hash[key] = 0 }
    input.each_char do |char|
      if allowed_chars.includes?(char)
        input_counts[char] += 1
      end
    end

    puts "\nBEFORE\nallowed_chars: #{allowed_chars}"
    puts "input: #{input}"
    puts "input_counts: #{input_counts}"
    puts "input_counts.to_a.sort.to_h: #{input_counts.to_a.sort.to_h}"
    puts "allowed_chars.size #{allowed_chars.size} vs input.size #{input.size} vs input_counts.keys.size: #{input_counts.keys.size}\nEND\n"

    allowed_chars.size == input_counts.keys.size
  end
end
