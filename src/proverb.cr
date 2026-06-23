module Proverb
  def self.recite(ingredients : Array(String)) : Array(String)
    array = Array(String).new
    if ingredients.size == 1
      array = ["And all for the want of a #{ingredients[0]}."]
    elsif ingredients.size > 1
      ingrd_prev = ingredients[0]
      ingredients[1..-1].map do |ingrd|
        array << "For want of a #{ingrd_prev} the #{ingrd} was lost."
        ingrd_prev = ingrd
      end
      array << "And all for the want of a #{ingredients[0]}."
    end
    array
  end
end
