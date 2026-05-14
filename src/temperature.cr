class Temperature
  def to_kelvin(celsius)
    # raise "Please implement the Temperature#to_kelvin method"

    celsius + 273.15
  end

  def round(celsius)
    # raise "Please implement the Temperature#round method"

    celsius.round(1)
  end

  def to_fahrenheit(celsius)
    # raise "Please implement the Temperature#to_fahrenheit method"

    # 0 C = 32 F
    # 1 C = 1.8 F
    # a = mx+b
    # a-b = mx
    # round(celsius * 1.8 + 32)

    ((celsius * 9/5) + 32).to_i
  end

  def number_missing_sensors(number_of_sensors)
    # raise "Please implement the Temperature#number_missing_sensors method"

    if number_of_sensors == 0
      0
    elsif number_of_sensors == 1
      3
    else
      frac = number_of_sensors / 4

      whole = (number_of_sensors / 4).round(0)

      (4*(frac - whole)).abs
    end
  end
end
