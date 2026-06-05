module Darts
  def self.score(x : Number, y : Number) : Number
    if Math.sqrt((x*y).abs) <= 1
      10
    elsif Math.sqrt((x*y).abs) <= 5
      5
    elsif Math.sqrt((x*y).abs) <= 10
      1
    else
      0
    end
  end
end
