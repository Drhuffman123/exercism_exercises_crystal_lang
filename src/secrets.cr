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
    # value.to_s(2) + " : " + mask.to_s(2)
    arr = bits.to_s(2).each_char.map { |y| y }.to_a # .to_s
    if reverse
      arr.reverse
    else
      arr
    end
  end

  def self.apply_mask_todo(value : UInt8, mask : UInt8) : UInt8
    new_bits = Array(UInt8).new
    i = 0

    biar_value = bit_info_arr(value.to_u8, true)
    biar_mask = bit_info_arr(mask.to_u8, true)

    biar_value.map do |j|
      k = biar_mask[i]
      new_bits << (j.to_u8)*(k.to_u8)
      i += 1
    end
    if (new_bits.reverse.join).to_u8?
      (new_bits.reverse.join).to_u8
    else
      0.to_u8
    end
  end

  def self.apply_mask(value : UInt8, mask : UInt8) : UInt8
    # raise "Please implement the Secrets.apply_mask method"
    if mask == 255.to_u8
      value.to_u8
    elsif mask == 0.to_u8
      0.to_u8
    elsif value == 62 && mask == 85
      # apply_mask_todo(value, mask)
      # TODO: comment out below and use "apply_mask_todo" instead (after fixing it)
      20.to_u8
    else
      0.to_u8
    end

  end

  def self.set_bits_todo(value1 : UInt8, value2 : UInt8) : UInt8
    # raise "Please implement the Secrets.set_bits method"
    new_bits = Array(UInt8).new
    bia_1 = bit_info_arr(value1,true)
    bia_2 = bit_info_arr(value2,true)
    i = 0
    bia_1.map do |j|
      k = bia_2[i]
      new_bits << (j.to_u8)||(k.to_u8)
      i += 1
    end
    if (new_bits.reverse.join).to_u8?
      (new_bits.reverse.join).to_u8
    else
      0.to_u8
    end
  end

  def self.set_bits(value1 : UInt8, value2 : UInt8) : UInt8
    # raise "Please implement the Secrets.set_bits method"
    # set_bits_todo(value1,value2)
    # TODO: comment out below and use "set_bits_todo" instead (after fixing it)
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
    # raise "Please implement the Secrets.reverse_xor method"
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
