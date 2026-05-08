class Library
  def self.first_letter(title : String) : Char
    title[0]
  end

  def self.initials(first_name : String, last_name : String) : String
    "#{first_letter(first_name)}.#{first_letter(last_name)}"
  end

  def self.decrypt_character(character : Char) : Char
    do_convert = ('A' <= character && character <= 'Z') || ('a' <= character && character <= 'z')
    if do_convert
      if character == 'A'
        'Z'
      elsif character == 'a'
        'z'
      else
        character.pred
      end
    else
      character
    end
  end

  def self.decrypt_text(text : String) : String
    result = ""
    text.each_char do |char|
      result += decrypt_character(char).to_s
    end
    result
  end
end
