module Anagram
  def self.count_per_char(word) : Hash
    char_counts = Hash(Char, Int32).new { |hash, key| hash[key] = 0 }

    word.each_char do |chr|
      char_counts[chr.downcase] += 1
    end

    char_counts.to_a.sort_by { |k, _| k }.to_h
  end

  def self.char_cnts_overlap(subject : String, maybe_word : String)
    count_per_char(subject) == count_per_char(maybe_word)
  end

  def self.find(subject : String, candidates : Array(String)) : Array(String)
    winners = Array(String).new
    candidates.map { |maybe_anagram|
      if subject.downcase != maybe_anagram.downcase
        if char_cnts_overlap(subject, maybe_anagram)
          winners << maybe_anagram
        end
      end
    }
    winners
  end
end
