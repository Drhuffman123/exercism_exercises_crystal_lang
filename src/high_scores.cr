class HighScores
  property scores : Array(Int32)

  def initialize(scores : Array(Int32))
    @scores = scores
  end

  def latest
    @scores[-1]
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    @scores.sort.reverse![0..2]
  end
end
