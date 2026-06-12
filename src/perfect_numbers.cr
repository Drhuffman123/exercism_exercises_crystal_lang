module PerfectNumbers
  def self.factors(number) : Array(Int32)
    factors = Array(Int32).new
    (1..(number/2).to_i).map { |factor|
      if number % factor == 0
        factors << factor
      end
    }
    factors
  end

  def self.aliquot_sum(number) : Number
    factors(number).sum
  end

  def self.classify(num : Number) : String
    if num <= 0
      raise ArgumentError.new(num.to_s)
    end

    if num == aliquot_sum(num)
      "perfect"
    elsif num < aliquot_sum(num)
      "abundant"
    elsif num > aliquot_sum(num)
      "deficient"
    else
      "tbd"
    end
  end
end
