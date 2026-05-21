module Squares
  def self.square_of_sum(num : Int32) : Int32
    if num == 1
      1
    else
      (1..num).sum ^ 2
    end
  end

  def self.sum_of_squares(num : Int32) : Int32
    if num == 1
      1
    else
      (1..num).map { |k| k ^ 2 }.sum
    end
  end

  def self.difference_of_squares(num : Int32) : Int32
    square_of_sum(num) - sum_of_squares(num)
  end
end

