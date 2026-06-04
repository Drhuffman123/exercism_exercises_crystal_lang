module RunLengthEncoding
  def self.encode_matching_chars(str : String) : String
    str.size.to_s + str[0].to_s
  end

  def self.decode_matching_chars(str : String) : String
    str_num_part = str.to_i.to_s
    str_num_part_size = str_num_part.size
    str_non_num_part_size = str.size - str_num_part_size
    str_non_num_part = str[str_num_part_size..str_non_num_part_size].to_s
    str_num_part + str_non_num_part
  end

  def self.encode(input : String) : String
    new_str = ""
    count_sets = 0
    char_starter = ""
    char_count = 0
    index_last = input.size
    input.chars.map_with_index { |char, index| 
      if char != "" && (char_count == 0)
        # puts "Skipping for char: input: #{input}, char: '#{char}'"
      # elsif (count_sets > 0) && 
      # elsif (char_count == 0) && (char_starter != char)
        # Found THE FIRST strater char, so count them...
        # raise "Start for char: input: #{input}, char: #{char}"
        puts "Start for char: input: #{input}, char: '#{char}'"
        char_count = 1
        # char_starter = 0
        char_starter = char
      # elsif (count_sets > 0) && 
      elsif (char_starter == char)
        puts "Oops, what to do here?"
        # # Then start counting the next set:
        # char_count = 1
        # char_starter = char
      elsif char_starter != char
        # Found THE NEXT strater char, so count them...
        # Append the previous set to our temp buffer str (i.e.: new_str):
        puts "Wrap up and re-start the count for char: input: #{input}, char_count: '#{char_count}', char: '#{char}', char_count: '#{char_count}'"

        new_str += char.to_s
        count_sets += 1 # ONLY at the end of the set
        char_count = 0 # Restart the count for the next set
        char_starter = char

        #   puts "MORE for char: input: #{input}, char: '#{char}'"
        #   # a multi-char set 
        #   char_count += 1 # ONLY at the beginning of the set
        #   char_starter = char
        #   new_str += "#{char_count}#{char_starter}"
        #   char_count = 0 # Restart the count for the next set
      elsif char_starter == char

        # Found the next matching char, so append the count...
        # char_prev += 1
        puts "Found the next matching char: '#{char}', char_count: '#{char_count}'"
        char_count += 1        
      else
        raise "Bad sequence: input: #{input}"
      end
    }
    puts "AND WE HAVE:... input: '#{input}', new_str: '#{new_str}', char_count: '#{char_count}'"
    if char_count == 0
      ""
    else
      # raise "AND WE HAVE:... input: '#{input}', new_str: '#{new_str}', char_count: '#{char_count}'"
      new_str
    end
  end

  def self.decode(input : String) : String
    if input == ""
      ""
    else
      strand.chars.map { |char| of_dna_one_strand(char) }.join
    end
  end
end
