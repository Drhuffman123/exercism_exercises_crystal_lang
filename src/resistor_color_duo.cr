require "./resistor_color.cr"

module ResistorColorDuo
  def self.value(values : Array(String)) : Number
    values[0..1].map {|val| ResistorColor.color_code(val)}.join.to_i
  end
end
