module PhoneNumber
  def self.check_11_digit_num(number : String)
    country_code = number[-11]
    if !['0', '1'].includes?(country_code)
      raise ArgumentError.new("Bad country_code: #{country_code} in number: #{number}")
    end
  end

  def self.check_10_digit_num(number : String)
    cleaned_num = number.gsub(/\D/, "")
    cleaned_num = cleaned_num[-10..-1]
    area_code0 = cleaned_num[-10]
    exchange0 = cleaned_num[-7]

    if ['0', '1'].includes?(area_code0)
      raise ArgumentError.new("Invalid area code (1st digit), number: #{number}, cleaned_num: #{cleaned_num}, area_code0: #{area_code0}, exchange0: #{exchange0}")
    elsif ['0', '1'].includes?(exchange0)
      # raise ArgumentError.new("Invalid area code or exhange (1st or 4th digit) in cleaned_num: #{cleaned_num}")
      raise ArgumentError.new("Invalid exhange (4th digit), number: #{number}, cleaned_num: #{cleaned_num}, area_code0: #{area_code0}, exchange0: #{exchange0}")
    end

    cleaned_num
  end

  def self.clean(phrase : String) : String
    new_num = phrase.gsub(/\D/, "")
    cleaned_num = new_num

    if new_num.size == 11
      check_11_digit_num(new_num)
    end

    if new_num.size >= 10
      cleaned_num = check_10_digit_num(new_num[-10..-1])
    end

    if new_num.size < 10
      raise ArgumentError.new("Less than 10 digits not allowed, in cleaned_num: #{cleaned_num}")
    end

    cleaned_num
  end
end
