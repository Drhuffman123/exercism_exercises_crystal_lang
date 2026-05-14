require "big"

class FotoFusionist
  def self.binary_to_int(binary : String) : Int32
    BigInt.new(binary, base: 2).to_i
  end

  def self.least_significant_bit(number : Int32) : Int32
    number.bit(0)
  end

  def self.hex_value(number : Int32) : String
    if number <= 7
      "0" + number.to_s(16)
    else
      number.to_s(16)
    end
  end

  def self.hex_value_from_rgb(red : Int32, green : Int32, blue : Int32) : String
    hex_value(red) + hex_value(green) + hex_value(blue)
  end
end
