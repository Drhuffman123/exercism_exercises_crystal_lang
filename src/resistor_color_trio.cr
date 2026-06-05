module ResistorColorTrio
  BAND_DIGITS = {"black": 0, "brown": 1, "red": 2, "orange": 3, "yellow": 4, "green": 5, "blue": 6, "violet": 7, "grey": 8, "white": 9}
  BAND_SCALES = {"black": "ohms", "brown": "kiloohms", "red": "megaohms", "orange": "gigaohms"}

  def self.offset_color(color_str, offset)
    BAND_SCALES.to_a
    BAND_SCALES[color_str]
  end

  def self.label_digits(values) : Array(String)
    val0 = values[0]
    val1 = values[1]
    band_scale = BAND_DIGITS[val0].to_s + BAND_DIGITS[val1].to_s
    if (band_scale.to_f/10).to_i == 0
      [(band_scale.to_f/10).to_i,10]
    else
      [band_scale.to_i,1]
    end
  end

  def self.label_scale(values) : Array(String)
    label_digits_with_scale = label_digits(values)
    BAND_SCALES[values[2]+label_digits_with_scale[1]].to_s
  end

  def self.label(values : Array(String), scale = 1) : String
    val = 10*BAND_DIGITS[values[0]] + BAND_DIGITS[values[1]]
    index = values[2]
    scale_color = values[2]
    scale = if (val/10) - (val/10).to_i == 0
        BAND_SCALES.values.to_a[index+1]
      else
        BAND_SCALES.values.to_a[index]
      end
    "#{val} #{scale}"
  end
end
