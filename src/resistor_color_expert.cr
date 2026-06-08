# require "../src/resistor_color.cr"

module ResistorColorExpert
  BAND_DIGITS = {"black": 0, "brown": 1, "red": 2, "orange": 3, "yellow": 4, "green": 5, "blue": 6, "violet": 7, "grey": 8, "white": 9}
  # BAND_SCALES     = {"black": "ohms", "brown": "kiloohms", "red": "megaohms", "orange": "gigaohms"}
  BAND_SCALES     = {"black": "ohms", "brown": "p1", "red": "p2", "orange": "kiloohms", "yellow": "p4", "green": "p5", "blue": "megaohms", "violet": "p7", "grey": "p8", "white": "gigaohms"}
  BAND_SCALE_MINS = {"black": 1, "brown": 1_000, "red": 1_000_000, "orange": 1_000_000_000}
  BANDS_TOLERANCE = {"grey": "±0.05%", "violet": "±0.1%", "blue": "±0.25%", "green": "±0.5%", "brown": "±1%", "red": "±2%", "gold": "±5%", "silver": "±10%"}

  def self.label1_str(values) : String
    "#{BAND_DIGITS[values[0]]} ohms"
  end

  def self.label2_str(values) : String
    val = BAND_DIGITS[values[0]] * 10 + BAND_DIGITS[values[1]]
    "#{val} ohms"
  end

  def self.label3_str(values : Array(String)) : String
    val = BAND_DIGITS[values[0]] * 10 + BAND_DIGITS[values[1]]
    # mult = BAND_DIGITS[values[2]]
    scale = BAND_SCALES[values[2]]
    # tol = BAND_DIGITS[values[3]]
    # "#{val*(10 ^ (mult-1))} #{scale}" #  #{tol}
    "#{val} #{scale}"
  end

  def self.label4_str(values : Array(String), scale = 1) : String
    val = BAND_DIGITS[values[0]] * 10 + BAND_DIGITS[values[1]]
    mult = BAND_DIGITS[values[2]]
    tol = BANDS_TOLERANCE[values[3]]
    "#{val*(10 ^ mult)} ohms #{tol}"
  end

  def self.label5_str(values : Array(String), scale = 1) : String
    val = BAND_DIGITS[values[0]] * 100 + BAND_DIGITS[values[1]] * 10 + BAND_DIGITS[values[2]]
    mult = BAND_DIGITS[values[3]]
    tol = BANDS_TOLERANCE[values[4]]
    "#{val*(10 ^ mult)} ohms #{tol}"
  end

  def self.resistor_label(bands : Array(String)) : String
    case bands.size
    when 1
      # "bands: #{bands}, bands.size: #{bands.size}:: 1 band: "
      # "1 band"
      label1_str(bands)
    when 2
      # "bands: #{bands}, bands.size: #{bands.size}:: 2 bands: "
      # "2 bands"
      label2_str(bands)
    when 3
      # "bands: #{bands}, bands.size: #{bands.size}:: 3 bands: "
      # "3 bands"
      label3_str(bands)
    when 4
      # "bands: #{bands}, bands.size: #{bands.size}:: 4 bands: "
      # "4 bands"
      label4_str(bands)
    else
      # "bands: #{bands}, bands.size: #{bands.size}:: 5 bands: "
      # "5 bands"
      label5_str(bands)
    end
  end
end
