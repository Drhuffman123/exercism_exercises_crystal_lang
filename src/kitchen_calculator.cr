module KitchenCalculator
  def self.get_volume(volume_pair)
    volume_pair.to_a[1]
  end

  def self.to_milliliter(volume_pair)
    pre_unit_value = ("0" + volume_pair.to_a[1].to_s).to_f
    new_unit_value = if volume_pair.to_a[0] == :milliliter
                       pre_unit_value
                     elsif volume_pair.to_a[0] == :cup
                       pre_unit_value * 240
                     elsif volume_pair.to_a[0] == :fluid_ounce
                       pre_unit_value * 30
                     elsif volume_pair.to_a[0] == :teaspoon
                       pre_unit_value * 5
                     elsif volume_pair.to_a[0] == :tablespoon
                       pre_unit_value * 15
                     end
    {:milliliter, new_unit_value}
  end

  def self.from_milliliter(volume_pair, unit)
    pre_unit_value = (volume_pair.to_a[1].to_s).to_f
    new_unit_value = if unit == :milliliter
                       pre_unit_value
                     elsif unit == :cup
                       pre_unit_value/240
                     elsif unit == :fluid_ounce
                       mid_units = pre_unit_value/30
                       (40*mid_units).round(0)/40
                     elsif unit == :teaspoon
                       mid_units = pre_unit_value/5
                       (40*mid_units).round(0)/40
                     elsif unit == :tablespoon
                       mid_units = pre_unit_value/15
                       (40*mid_units).round(0)/40
                     else
                       0
                     end
    {unit, new_unit_value.to_f}
  end

  def self.convert(volume_pair, unit)
    from_to_hash = from_milliliter(to_milliliter(volume_pair), unit)
    new_unit_name = from_to_hash.to_a[0]
    new_unit_value = from_to_hash.to_a[1].to_s.to_f
    {new_unit_name, new_unit_value}
  end
end
