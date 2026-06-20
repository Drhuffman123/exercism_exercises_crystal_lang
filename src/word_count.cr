module WordCount
  def self.count_words(sentence : String) : Hash(String, Int32)
    sentence.scan(/\b[\w']+\b/).reduce({} of String => Int32) do |counts, match|
      word = match[0].downcase # The matched word
      counts[word] = counts.fetch(word, 0) + 1
      counts
    end
  end
end
