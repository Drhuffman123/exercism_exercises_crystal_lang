module Darts
  def self.sqrt(x : Number, y : Number) : Number
    Math.sqrt((x*x + y*y).abs)
  end

  def self.score(x : Number, y : Number) : Number
    if sqrt(x, y) <= 1
      10
    elsif sqrt(x, y) <= 5
      5
    elsif sqrt(x, y) <= 10
      1
    else
      0
    end
  end
end
