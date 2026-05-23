module Isogram
  def self.isogram?(phrase : String) : Bool
    if phrase == ""
      true
    else
      phrase_cleaned = phrase.gsub(" ", "").gsub("-", "").downcase
      counts = Hash(Char, Int32).new(0)
      phrase_cleaned.each_char do |char|
        counts[char] += 1
      end
      counts.keys.size == counts.values.size == counts.values.sum
    end
  end
end
