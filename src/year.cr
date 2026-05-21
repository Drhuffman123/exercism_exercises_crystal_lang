module Year
  def self.leap?(year : Number) : Bool
    reg_leap = (year/4) == (year/4).to_i
    hund_leap = (year/100) == (year/100).to_i
    quad_hund_leap = (year/400) == (year/400).to_i

    quad_hund_leap || reg_leap && !hund_leap
  end
end
