class InvalidCowsError < Exception
  def initialize(@value : Int32) # message : String? = nil,
    if @value <= 0
      if @value < 0
        msg = "#{@value} cows are invalid: there are no negative cows"
        super(msg)
      elsif @value == 0
        msg = "0 cows are invalid: no cows don't need food"
        super(msg)
      end
    else
      nil
    end
  end
end

class FodderCalculator
  property total_food : Int32 | Float64
  property animals : Int32 | Float64

  def initialize(total_food : Int32 | Float64 | Nil, animals : Int32 | Float64 | Nil)
    @total_food = 0
    @animals = 0

    if !total_food.nil?
      @total_food = total_food
    end

    if !animals.nil?
      @animals = animals
    end
  end

  def fodder_amount!
    if !@total_food.nil?
      Float64.new("0#{@total_food}")
    else
      0
    end
  end

  def fattening_factor!
    # @total_food * fodder_amount!
    # @animals
  end
end

module TheFarm
  def self.divide_food(food : FodderCalculator, number_of_cows : Int32 = 0)
    if food.animals == 0
      0
    else
      (food.total_food * food.animals) / number_of_cows.to_f
    end
  end

  def self.validate_input_and_divide_food(food : FodderCalculator, number_of_cows : Int32)
    if number_of_cows > 0
      divide_food(food, number_of_cows)
    else
      raise "Number of cows must be greater than 0"
    end
  end

  def self.validate_number_of_cows(number_of_cows : Int32)
    if number_of_cows > 0
      nil
    elsif number_of_cows == 0
      raise InvalidCowsError.new(number_of_cows) # msg,
    elsif number_of_cows < 0
      raise InvalidCowsError.new(number_of_cows) # msg,
    else
      nil
    end
  end
end
