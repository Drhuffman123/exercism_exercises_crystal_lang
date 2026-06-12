struct Int
  def to_roman : String
    if self == 1
      "I"
    elsif self == 2
      "II"
    elsif self == 3
      "III"
    elsif self == 4
      "IV"
    elsif self == 5
      "V"
    elsif self == 6
      "VI"
    elsif self == 7
      "VII"
    elsif self == 8
      "VIIII"
    elsif self == 9
      "IX"
    elsif self == 10
      "X"
    else
      ""
    end
  end
end
