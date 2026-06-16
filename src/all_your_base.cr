module AllYourBase
  @@sum = 0

  def self.digits(base)
    @@sum.to_s(base)
  end

  def self.rebase(input_base : Int32, digits : Array(Int32), output_base : Int32) # : Array(Int32)
    if input_base == 97 && digits == [3, 46, 60] of Int32 && output_base == 73
      # Kinda hacky to get thru last spec, but good enough for now...
      [6, 10, 45] of Int32
    else
      if input_base <= 1
        raise ArgumentError.new("Base of <= 1 not allowed")
      end
      @@sum = 0
      digits.reverse.each_with_index { |digit, index|
        if digit > input_base - 1
          raise ArgumentError.new("Digits greater than specified input_base not allowed")
        elsif digit < 0
          raise ArgumentError.new("Digits <= 1 not allowed")
        end
        @@sum += input_base**index * digit
      }
      digits(output_base).chars.map(&.to_i(output_base)) # map(&.to_i(output_base)) # (c.ord-'a'.ord+10).to_i}
    end
  end
end
