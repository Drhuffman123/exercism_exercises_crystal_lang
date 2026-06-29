require "yaml"

class RobotSimulator
  include YAML::Serializable

  class BadPos < Exception
  end

  DIRECTIONS = %i(north east south west)

  property x : Int32 # W/E
  property y : Int32 # N/S
  property d : Int32 # direction index
  property direction : Symbol

  def initialize(xy : Tuple, sym : Symbol)
    @x = xy[0]
    @y = xy[1]
    @d = if DIRECTIONS[0] == sym
           0
         elsif DIRECTIONS[1] == sym
           1
         elsif DIRECTIONS[2] == sym
           2
         else # if DIRECTIONS[3] == sym
           3
         end
    @direction = sym
  end

  def tp(x, y, d)
    @x = x
    @y = y
    @d = d
    @direction = DIRECTIONS[@d]
    self
  end

  def move_right
    @d += 1
    # if @d <= 0
    #   @d += 4
    # end
    if @d >= 3
      @d -= 4
    end
    @direction = DIRECTIONS[@d]
    # raise BadPos.new("Right")
    self
  end

  def move_left
    # @direction = DIRECTIONS[@d] - 1
    @d -= 1
    if @d <= 0
      @d += 4
    end
    # if @d >= 3
    #   @d -= 4
    # end
    @direction = DIRECTIONS[@d]
    # raise BadPos.new("Left")
    self
  end

  def move_advance
    # raise "Advance"
    if @d == 0
      @y += 1
      # raise BadPos.new("adv N")
    elsif @d == 1
      @x += 1
      # raise BadPos.new("adv E")
    elsif @d == 2
      @y -= 1
      # raise BadPos.new("adv S")
    else # if @direction == :west
      @x -= 1
      # raise BadPos.new("adv W")
    end
    self
  end

  def move(dir_str : String)
    dir_str.chars.map do |change|
      case change
      when "R" # Right
        move_right
      when "L" # Left
        move_left
      when "A" # Advance
        move_advance
      end
    end
    self
  end
end
