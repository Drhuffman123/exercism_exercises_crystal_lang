module Secrets
  def self.shift_back(value : UInt8, number_of_places : UInt8) : UInt8
    new_value = value.to_u16
    if number_of_places > 0
      (1..number_of_places).map do # |value|
        new_value = new_value * 2
      end
    end
    if new_value > 255
      0.to_u8
    else
      new_value.to_u8
    end
  end

  def self.apply_mask(value : UInt8, mask : UInt8) : UInt8
    # raise "Please implement the Secrets.apply_mask method"
    0.to_u8
  end

  def self.set_bits(value1 : UInt8, value2 : UInt8) : UInt8
    # raise "Please implement the Secrets.set_bits method"
    0.to_u8
  end

  def self.reverse_xor(value : UInt8, agreed_value : UInt8) : UInt8
    # raise "Please implement the Secrets.reverse_xor method"
    0.to_u8
  end
end
