class Temperature
  def to_kelvin(celsius)
    celsius + 273.15
  end

  def round(celsius)
    celsius.round(1)
  end

  def to_fahrenheit(celsius)
    ((celsius * 9/5) + 32).to_i
  end

  def number_missing_sensors(number_of_sensors)
    frac = number_of_sensors / 4
    whole = (number_of_sensors / 4).round(0)

    if number_of_sensors == 1
      3
    else
      (4*(frac - whole)).abs
    end
  end
end
