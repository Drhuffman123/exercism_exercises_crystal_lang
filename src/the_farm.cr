class InvalidCowsError < Exception
  def initialize(message : String? = nil, @value = 0)
    super("#{@value} cows are invalid: #{message}")
  end
end

class FodderCalculator
  # property num : Int32
  # property ratio : Float64
  property total_food : Int32 | Float64 # | Nil
  property animals : Int32 | Float64 # | Nil
    
  def initialize(@total_food : Int32 | Float64, @animals : Int32 | Float64) #  | Nil
    # raise "oops" if @animals.nil? # || @animals.to_f < 1
    @total_food / @animals
  end
    
  def fodder_amount!()
    @total_food
  end

  def fattening_factor!()
    @ratio
  end
end

module TheFarm

  def self.divide_food(food : FodderCalculator? = nil, number_of_cows = 0)
    if number_of_cows.nil? || number_of_cows.to_f <= 0
      raise InvalidCowsError.new("number_of_cows MUST be > 0")
    else
      food.fodder_amount! / number_of_cows
    end
  end

  def self.validate_input_and_divide_food(food : FodderCalculator, number_of_cows : Int32)
    if number_of_cows > 0
      divide_food
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
