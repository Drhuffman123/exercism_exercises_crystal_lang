class LargestSeriesProduct
  property num_str : String

  def initialize(num_str : String)
    @num_str = num_str
    if num_str =~ /\D+/
      raise ArgumentError.new("Oops, only digits allowed, but got some non digits in num_str: #{num_str}")
    end
  end

  def to_s
    @num_str.to_s
  end

  def largest_product(span)
    if span > @num_str.size
      raise ArgumentError.new("opps, we can sum at most #{@num_str.size} digits")
    elsif span <= 0
      raise ArgumentError.new("opps, we can't get a product of zero or less digits (#{span})")
    end
    digits = @num_str.chars
    result = Array(Int32).new
    digits[0..-span].each_with_index { |_, i|
      result << digits[i..i + span - 1].product(&.to_i)
    }
    result.max
  end
end
