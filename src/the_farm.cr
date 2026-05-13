class InvalidCowsError < Exception
  def initialize(message : String? = nil, @value = 0)
    super("#{@value} cows are invalid: #{message}")
  end
end

class FodderCalculator
  # property num : Int32
  # property ratio : Float64
  property total_food : Int32 | Float64 | Nil
  property animals : Int32 | Float64 | Nil
    
  def initialize(total_food  : Int32 | Float64 | Nil, animals : Int32 | Float64 | Nil)
    @total_food = total_food
    @animals = animals

    if @total_food.nil? || @animals.nil?
      raise "oops"
    end
  end
    
  def fodder_amount!
    if !@total_food.nil?
      # @total_food.to_f64
      Float64.new("0#{@total_food}")
    else
      0
    end
  end

  def fattening_factor!
    # TBD: @ratio
  end
end

module TheFarm

  # ? = nil
  def self.divide_food(food : FodderCalculator | Nil, number_of_cows : Int32 | Nil = 0)
    if number_of_cows.nil? || number_of_cows.to_f <= 0
      raise InvalidCowsError.new("number_of_cows MUST be > 0")
    elsif food.nil?
      raise InvalidCowsError.new("food MUST be > 0")
    else
      food.fodder_amount!.to_f / number_of_cows.to_f
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
    if number_of_cows < 0
      "there are no negative cows"
    elsif number_of_cows == 0
      InvalidCowsError.new("no cows don't need food")
    else
      nil      
    end
  end
end
