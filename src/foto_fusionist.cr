class FotoFusionist
  def self.binary_to_int(binary : String) : Int32
    # raise "Please implement the FotoFusionist.binary_to_int method"
    binary.to_i(8)
  end

  def self.least_significant_bit(number : Int32) : Int32
    # raise "Please implement the FotoFusionist.least_significant_bit method"
    number.bit(0)
  end

  def self.hex_value(number : Int32) : String
    # raise "Please implement the FotoFusionist.hex_value method"
    if number <= 7
      "0" + number.to_s(16)
    else
      number.to_s(16)
    end
  end

  def self.hex_value_from_rgb(red : Int32, green : Int32, blue : Int32) : String
    # raise "Please implement the FotoFusionist.hex_value_from_rgb method"
    ""
    red.to_s(16) + green.to_s(16) + blue.to_s(16)
  end
end
