class Raindrops
  def self.err_if_div_evenly_by(num, quotient, drop)
    puts "\n* num: #{num}, quotient: #{quotient}, drop: #{drop}, (num/quotient).to_i: #{(num/quotient).to_i}, (num.to_f/quotient).to_s: #{(num.to_f/quotient).to_s}"
    if (num/quotient).to_i == (num/quotient) # .to_f # .to_i
      drop
    else
      ""
    end
  end

  def self.convert(num : Int32) : String
    err_str = err_if_div_evenly_by(num, 3, "Pling") + err_if_div_evenly_by(num, 5, "Plang") + err_if_div_evenly_by(num, 7, "Plong")
    if err_str != ""
      err_str
    else
      num.to_s
    end
  end
end
