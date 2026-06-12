module LineUp
  def self.ordinal_suffix(n : Int)
    return "th" if (11..13).includes?(n % 100)

    case n % 10
    when 1; "st"
    when 2; "nd"
    when 3; "rd"
    else    "th"
    end
  end

  def self.format(name : String, number : Int32) : String
    name + ", you are the #{number}#{ordinal_suffix(number)} customer we serve today. Thank you!"
  end
end
