class CastleDinner
  def self.check_food?(food)
    if food == "Mushroom pasties"
      food
    else
      nil
    end
  end

  def self.check_drink?(drink)
    /i|I/ =~ drink ? drink : nil
  end

  def self.replace_drink(drink)
    check_drink?(drink) || "Apple juice"
  end
end
