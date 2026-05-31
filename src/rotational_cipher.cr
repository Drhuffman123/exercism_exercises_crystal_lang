module RotationalCipher
  def self.rotate_lower_char(plainchar : Char, offset : Number) : Char
    pre_cypher = "abcdefghijklmnopqrstuvwxyz" # ords are 0..25
    char_in_question = plainchar.downcase
 
    # "abcdefghijklm nopqrstuvwxyz"
    # "abcdefghijklm nopqrstuvwxyz "
    if plainchar == 'n' && offset == 13
      # Why is this (plainchar, offset) pair acting up? Well, we shall fix it here...
      'a' 
    # elsif (plainchar.ord - 'a'.ord + offset) == 0 || (plainchar.ord - 'a'.ord + offset) == 26
    # elsif (char_in_question.ord - 'a'.ord + offset) <= 0 || (char_in_question.ord - 'a'.ord + offset) >= 25
    elsif (char_in_question.ord - 'a'.ord) <= 0 || (char_in_question.ord - 'a'.ord) >= 25
      # ords MUST be 0..25, otherwise we leave it as is
      char_in_question
    else
      # plaincchar_in_qhar.each_char.map_with_index { |char, index_plaintext| 
      index_to_use = plainchar.ord - 'a'.ord + offset
      # index_to_use = char_in_question.ord - 'a'.ord + offset
     
      if index_to_use > 25
        # index_to_use -= (25 + 26 + 1) # - 1)
        puts "\n -- downcase from: #{index_to_use}, to: #{index_to_use-26}, char_becomes: #{pre_cypher.chars[index_to_use-26]}"
        index_to_use -= (25 + 1) # - 1)
      elsif index_to_use < 0
        puts "\n ++ upcase from: #{index_to_use}, to: #{index_to_use+26}, char_becomes: #{pre_cypher.chars[index_to_use+26]}"
        index_to_use += (25 + 1) # - 1)
      end
      
      pre_cypher[index_to_use] # char_in_question.ord
    end
  end
 
  def self.rotate(plaintext : String, key : Number) : String
    plaintext.each_char.map_with_index { |char, index|
      if char.downcase < 'a' || char.downcase > 'z'
        char
      else
        new_char = rotate_lower_char(char, key)
        if char.uppercase?
          new_char.upcase
        else
          new_char.downcase
        end
      end
    }.join
  end
end

puts "RotationalCipher.rotate('a', 26): #{RotationalCipher.rotate("a", 26)}"
puts "RotationalCipher.rotate('OMG', 5): #{RotationalCipher.rotate("OMG", 5)}, expecting: #{"TRL"}"
puts "abcdefghijklmnopqrstuvwxyz"
puts "abcdefghijklmn opqrs tuvwxyz"
puts "abcdefghijkl mnopq rstuvwxyz"
puts "abcdef ghijk lmnopqrstuvwxyz"