require "big"

module Grains
  # Write your code for the 'Grains' exercise in this file.
  def self.square(number : Number) : Number
    if number < 0
      raise ArgumentError.new("Too small!")
    elsif number > 64
      raise ArgumentError.new("Too big!")
    elsif number >= 32
      BigInt.new(2**(number - 1))
    else
      Int32.new(2 ** (number - 1))
    end
  end

  def self.total : Number # 
    result = Int128.new(1)
    range = (1..32)
    # range = (1..64) 
    range.sum(result) { |sqr| square(sqr-1)}
    # What? Even with BigInt, Crystal can't seem to count that high
  end
end
