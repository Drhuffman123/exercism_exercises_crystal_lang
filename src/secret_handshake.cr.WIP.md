module SecretHandshake
  def self.actions
    {
      1 => "wink",
      10 =>"double blink",
      100 => "close your eyes",
      1000 => "jump",
      10000 => "Reverse the order of the operations in the secret handshake.",
    }
  end

  def self.digit(dig : Number) : String | Nil
    puts "\n digs: #{dig} aka #{dig.to_s(2)}"
    dig.to_s(2).chars.map_with_index { |digit, i| 
      puts "\n -- digs: #{dig} aka #{dig.to_s(2)}, digit: #{digit}, i: #{i}"
      if [1,2,4,8,16].includes?(digit)
        "\n digit: #{digit}, action: #{actions[digit.to_i]}"
      else
        ""
      end
    }.join
  end
  
  def self.commands(input : Number) # : Array(String)
    input.to_s(2).chars.map { |digit| 
      actions[digit.to_i] # actions[(digit.to_i).to_s] 
    }
  end
end

puts "actions: #{SecretHandshake.actions}, keys: #{SecretHandshake.actions.keys}"
puts "actions: #{SecretHandshake.actions}, keys: #{SecretHandshake.actions.keys.map_with_index{|k,i| "#{k} @ #{i}" }}"

puts "digit 2: #{SecretHandshake.digit(2)}"
puts "digit 3: #{SecretHandshake.digit(3)}"
puts "digit 4: #{SecretHandshake.digit(4)}"

puts "0: #{0.to_s(2)}"
puts "1: #{1.to_s(2)}"
puts "2: #{2.to_s(2)}"
puts "3: #{3.to_s(2)}"
puts "4: #{4.to_s(2)}"
puts "5: #{5.to_s(2)}"

puts "2**0: #{(2**0).to_s(2)}"
puts "2**1: #{(2**1).to_s(2)}"
puts "2**2: #{(2**2).to_s(2)}"
puts "2**3: #{(2**3).to_s(2)}"
puts "2**4: #{(2**4).to_s(2)}"
puts "2**5: #{(2**5).to_s(2)}"

puts "1.log(2): #{Math.log((2**0), 2).to_i}"
puts "10.log(2): #{Math.log((2**1), 2).to_i}"
puts "100.log(2): #{Math.log((2**2), 2).to_i}"
puts "1000.log(2): #{Math.log((2**3), 2).to_i}"
puts "10000.log(2): #{Math.log((2**4), 2).to_i}"
puts "100000.log(2): #{Math.log((2**5), 2).to_i}"