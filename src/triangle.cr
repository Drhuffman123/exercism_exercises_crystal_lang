class Triangle
  property sides : Tuple(Int32 | Float64, Int32 | Float64, Int32 | Float64)

  def initialize(sides : Tuple(Int32 | Float64, Int32 | Float64, Int32 | Float64))
    @sides = sides
    if !valid_sides?(sides)
      raise ArgumentError.new("Side lengths do not make a valid triangle")
    end
  end

  def valid_sides?(sides)
    side0 = sides[0]
    side1 = sides[1]
    side2 = sides[2]
    (side0 > 0 && side1 > 0 && side2 > 0) && (side0 + side1 >= side2) && (side1 + side2 >= side0) && (side2 + side0 >= side1)
  end

  def equilateral?
    @sides[0] == @sides[1] == @sides[2]
  end

  def isosceles?
    (@sides[0] == @sides[1]) ||
      (@sides[1] == @sides[2]) ||
      (@sides[2] == @sides[0])
  end

  def scalene?
    (@sides[0] != @sides[1]) &&
      (@sides[1] != @sides[2]) &&
      (@sides[2] != @sides[0])
  end
end
