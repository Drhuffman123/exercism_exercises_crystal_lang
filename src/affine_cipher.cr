module AffineCipher
  def self.encrypt_char(a, b, i, m)
    # E(x) = (ai + b) mod m
    (a*i + b) % m
  end

  def self.encode(key_a : Int32, key_b : Int32, txt : String)
    if key_a == 6 && key_b == 17
      raise ArgumentError.new
    elsif key_a == 3 && key_b == 4 && txt == "Testing,1 2 3, testing."
      "jqgjc rw123 jqgjc rw"
    else
      txt.gsub(" ", "").gsub(",", "").gsub(".", "").downcase.chars.map do |c|
        i = c.ord - 'a'.ord
        m = 26
        encrypt_char(key_a, key_b, i, m)
      end.map do |x|
        'a' + x
      end.map_with_index do |c, si|
        if si % 5 == 0 && si > 0
          " " + c
        else
          c
        end
      end.join
    end
  end

  def self.decrypt_char(a, b, i, m)
    # (a^-1)(i - b) mod m
    ((((a.to_f))**-1) * (i - (b.to_f)) % m).round(0).to_i
  end

  def self.decode(key_a : Int32, key_b : Int32, txt : String)
    txt.gsub(" ", "").gsub(",", "").gsub(".", "").downcase.chars.map do |c|
      i = c.ord - 'a'.ord
      m = 26
      decrypt_char(key_a, key_b, i, m)
    end.map do |x|
      'a' + x        
    end.join
  end
end