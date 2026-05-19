module KitchenCalculator
  def self.get_volume(volume_pair)
    volume_pair.to_a[1]
  end

  def self.to_milliliter(volume_pair)
    new_units = if volume_pair.to_a[0] == :milliliter
                  volume_pair.to_a[1].to_i * 1
                elsif volume_pair.to_a[0] == :cup
                  volume_pair.to_a[1].to_i * 240
                elsif volume_pair.to_a[0] == :fluid_ounce
                  volume_pair.to_a[1].to_i * 30
                elsif volume_pair.to_a[0] == :teaspoon
                  volume_pair.to_a[1].to_i * 5
                elsif volume_pair.to_a[0] == :tablespoon
                  volume_pair.to_a[1].to_i * 15
                end
    {:milliliter, new_units}
  end

  def self.from_milliliter(volume_pair, unit)
    new_units = if unit == :milliliter
                  volume_pair.to_a[1].to_i
                elsif unit == :cup
                  volume_pair.to_a[1].to_i/240
                elsif unit == :fluid_ounce
                  mid_units = volume_pair.to_a[1].to_i/30
                  (4*mid_units).round(0)/4
                elsif unit == :teaspoon
                  mid_units = volume_pair.to_a[1].to_i/5
                  (4*mid_units).round(0)/4
                elsif unit == :tablespoon
                  mid_units = volume_pair.to_a[1].to_i/15
                  (4*mid_units).round(0)/4
                else
                  0
                end
    {unit, new_units}
  end

  def self.convert(volume_pair, unit)
    # raise "Please implement the KitchenCalculator.convert method"
    0
  end
end
