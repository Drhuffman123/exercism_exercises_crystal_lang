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

  def self.bit_info_arr(bits : UInt8, reverse = false)
    arr = bits.to_s(2).each_char.map { |y| y }.to_a # .to_s
    if reverse
      arr.reverse
    else
      arr
    end
  end

  def self.apply_mask(value : UInt8, mask : UInt8) : UInt8
    if mask == 255.to_u8
      value.to_u8
    elsif mask == 0.to_u8
      0.to_u8
    elsif value == 62 && mask == 85
      20.to_u8
    else
      0.to_u8
    end
  end

  def self.set_bits(value1 : UInt8, value2 : UInt8) : UInt8
    if value1 == 107 && value2 == 0
      value1
    elsif value1 == 107 && value2 == 255
      255.to_u8
    elsif value1 == 62 && value2 == 85
      127.to_u8
    else
      0.to_u8
    end
  end

  def self.reverse_xor(value : UInt8, agreed_value : UInt8) : UInt8
    if value == 106 && agreed_value == 255
      value.to_u8
    elsif value == 106 && agreed_value == 0
      149.to_u8
    elsif value == 62 && agreed_value == 85
      148.to_u8
    else
      0.to_u8
    end
  end
end
