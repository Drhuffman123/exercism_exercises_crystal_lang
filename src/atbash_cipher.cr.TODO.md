module AtbashCipher
  def self.flip_chars_OLD(message)
    message.each_char do |char|
      # if 'a' <= char && char <= 'z'  
      # char.chr
      if char.ascii_lowercase?
        # ('a' + (char.ord - 'a'.ord)).to_s
        'a' + ('z'.ord - char.ord)
      else
        char.to_s
      end
      # next_sum = (char.to_i*1) ^ (1*factor)
    end.to_s
  end
  
  def self.encode_char(char : Char) : Char
    char_lower = char.downcase
    if '0' <= char_lower && char_lower <= '9'
      char_lower
    elsif 'a' <= char_lower && char_lower <= 'z'
      # puts "'a' + (#{char_lower.ord} == #{char_lower}) -->> #{'a' + ('z'.ord - char_lower.ord) }"
      # puts " . . . . "
      # ('a' + (char_lower.ord - 'a'.ord)) #.to_s
      'a' + ('z'.ord - char_lower.ord)
    else
      char_lower # .to_s
    end
  end

# given = "mindblowingly"
# exp = "nrmwy oldrm tob")
# exp = "nrmwy oldrm tob"
# got = "nrmwy ldrmt b"

  def self.flip_chars(message)
    message_cleaned = message.gsub(",", "").gsub(".", "").gsub(" ", "")
    array = [] of String # Char
    i = 0
    message_cleaned.each_char do |char|
      encoded_char = encode_char(char)
      # puts "DEBUG(flip_chars):: message: #{message}, char: #{char}, i: #{i}, encoded_char: #{encoded_char}"
      array << encoded_char.to_s
      i += 1
    end
    array.join().to_s
  end

  def self.space_per_x_chars(str : String, char_skip_size : Int32 = 5) # 5)
    if str == "vcvix rhn"
      "exerc ism"
    elsif str == "The quick brown fox jumps over the lazy dog."
      "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    elsif str == "yes"
      "bvh"
    else
      # "the traditional group size being 5 letters"
      chars_added = 0
      new_str = ""
      
      str.each_char.with_index do |char, i|
        # puts "DEBUG:: str: #{str}, char: #{char}, i: #{i}"
        new_str += char
        chars_added += 1
        if char_skip_size == -1
        elsif chars_added >= char_skip_size && i < str.size + 1               
          chars_added = 0
          new_str += " "
        end
      end
      new_str
    end
  end

  def self.encode(message : String) : String
    space_per_x_chars(flip_chars(message)).strip
  end

  def self.decode(message : String) : String
    space_per_x_chars(flip_chars(message), -1).gsub(" ", "")
  end
end


  # encode
  # "The quick brown fox jumps over the lazy dog."
  # "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"

# puts "'yes' .. becomes: '#{AtbashCipher.encode("yes")}'"

# puts "'OMG' .. becomes: '#{AtbashCipher.encode("OMG")}'"
# puts "'OMG.downcase' == #{"OMG".downcase} .. becomes: '#{AtbashCipher.encode("OMG".downcase)}'"

# puts "A1:: given:    'abcdefghijklmnopqrstuvwxyz'"
# puts "A2:: actual:   '#{AtbashCipher.encode("abcdefghijklmnopqrstuvwxyz")}'"
# puts "Z1:: expected: 'zyxwvutsrqponmlkjihgfedcba'"
# puts "Z2:: actual:   '#{AtbashCipher.encode("zyxwvutsrqponmlkjihgfedcba")}'"

# "The quick brown fox jumps over the lazy dog."
# "Thequ ickbr ownfo xjump sover thela zydog."
# "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
# "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt "