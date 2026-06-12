struct Int
  def to_roman : String
    raise "Out of range" if self <= 0 || self > 10000

    roman_nums = {
      1000 => "M",
       900 => "CM",
       500 => "D",
       400 => "CD",
       100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
         9 => "IX",
         5 => "V",
         4 => "IV",
         1 => "I",
    }

    num = self
    val_str = ""

    roman_nums.each do |v, x|
      while num >= v
        val_str += x
        num -= v
      end
    end

    val_str
  end
end
