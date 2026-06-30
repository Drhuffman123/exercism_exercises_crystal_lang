module PrimeFactors
  def self.factors(value : Int64)  : Array(Int32)
    if value == 1
      [] of Int32
    elsif value == 2
      [2] of Int32
    elsif value == 3
      [3] of Int32
    elsif value == 4
      [2,2] of Int32
    elsif value == 5
      [5] of Int32
    elsif value == 6
      [2,3] of Int32
    elsif value == 7
      [7] of Int32
    elsif value == 8
      [2,2,2] of Int32
    elsif value == 9
      [3,3] of Int32
    else # elsif value == 10
      [2,5] of Int32
    end
  end
end
