module ScrabbleScore
  def self.score(word : String) : Int32
    score = 0
    word.upcase.each_char do |char|
      if "QZ".includes?(char)
        score += 10
      elsif "JX".includes?(char)
        score += 8
      elsif "K".includes?(char)
        score += 5
      elsif "FHVWY".includes?(char)
        score += 4
      elsif "BCMP".includes?(char)
        score += 3
      elsif "DG".includes?(char)
        score += 2
      else
        score += 1
      end
    end
    score
  end
end
