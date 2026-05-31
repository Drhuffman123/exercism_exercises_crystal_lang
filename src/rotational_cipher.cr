module RotationalCipher
  def self.wrap_to_alpha_lowercase(char : Char) : Char
    mid_char = char.downcase
    new_char = if mid_char < 'a'
      mid_char + 26
    elsif mid_char > 'z'
      mid_char - 26
    else
      mid_char
    end
    new_char.downcase
  end

  def self.only_non_alpha_chars(char) : Char | Nil
    if char.downcase < 'a' || char.downcase > 'z'
      char
    else
      nil
    end
  end

  def self.wrap_to_alpha_uppercase(char : Char) : Char
    wrap_to_alpha_lowercase(char.downcase).upcase
  end

  def self.rotate_lower_char(plainchar : Char, offset : Number) : Char
    only_non_alpha_chars(plainchar) || wrap_to_alpha_lowercase(plainchar)
  end
end
