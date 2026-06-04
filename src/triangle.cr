class Triangle
  property sides : Tuple(Int32 | Float64, Int32 | Float64, Int32 | Float64)

  def initialize(sides : Tuple(Int32 | Float64, Int32 | Float64, Int32 | Float64))
    @sides = sides
  end

  def equilateral?
    @sides[0] == @sides[1] == @sides[2]
  end

  def isosceles?
    (@sides[0] == @sides[1]) ||
    (@sides[1] == @sides[2]) ||
    (@sides[2] == @sides[0])
  end

  def self.err_if_div_evenly_by(num, quotient, drop)
    if (num/quotient).to_i == (num/quotient) # .to_f # .to_i
      drop
    else
      ""
    end
  end

  def self.convert(num : Int32) : String
    err_str = err_if_div_evenly_by(num, 3, "Pling") + err_if_div_evenly_by(num, 5, "Plang") + err_if_div_evenly_by(num, 7, "Plong")
    if err_str != ""
      err_str
    else
      num.to_s
    end
  end
end
