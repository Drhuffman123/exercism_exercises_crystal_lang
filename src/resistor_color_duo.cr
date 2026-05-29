module ResistorColor
  def self.color_code(color : String) : Int32 | Nil
    if colors.includes?(color)
      color_indexes[color]
    else
      nil
    end
  end

  def self.colors : Array
    ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
  end

  def self.color_indexes : Hash
    hash_colors = Hash(String, Int32).new { |hash, key| hash[key] = 0 }
    colors.map_with_index do |color, index|
      hash_colors[color] = index
    end
    hash_colors
  end
end

module ResistorColorDuo
  def self.value(values : Array(String)) : Number
    values[0..1].map { |val| ResistorColor.color_code(val) }.join.to_i
  end
end
