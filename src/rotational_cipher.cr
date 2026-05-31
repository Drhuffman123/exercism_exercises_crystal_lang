module RotationalCipher
  ALLOWED_ALPHAS       = ('a'..'z').to_a.join
  ALLOWED_ALPHAS_UPPER = ALLOWED_ALPHAS.upcase

  def self.index_cleaned(index)
    if index < 0
      index_cleaned(index + ALLOWED_ALPHAS.size)
    elsif index > ((ALLOWED_ALPHAS.size) - 1)
      index_cleaned(index - ALLOWED_ALPHAS.size)
    else
      index
    end
  end

  def self.wrap_lower(char, offset)
    wrapped_index = index_cleaned(char.ord - 'a'.ord + offset)
    ALLOWED_ALPHAS[wrapped_index]
  end

  def self.wrap_upper(char, offset)
    wrap_lower(char.downcase, offset).upcase
  end

  def self.wrap_just_alpha(char : Char, offset : Int32) : Char
    if char.lowercase?
      wrap_lower(char, offset)
    elsif char.uppercase?
      wrap_upper(char.upcase, offset).upcase
    else
      char
    end
  end

  def self.wrap_either(char : Char, offset : Int32) : Char
    if char.lowercase?
      wrap_lower(char, offset)
    elsif char.uppercase?
      wrap_upper(char.upcase, offset).upcase
    else
      char
    end
  end

  def self.rotate(plaintext : String, key : Number) : String
    plaintext.chars.map { |char|
      if char.lowercase?
        wrap_either(char, key)
      elsif char.uppercase?
        wrap_either(char, key)
      else
        char
      end
    }.join
  end
end
