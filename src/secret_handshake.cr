module SecretHandshake
  def self.actions
    # {
    #    "1" => "wink",
    #    "2" => "double blink",
    #    "4" => "close your eyes",
    #    "8" => "jump",
    #   "16" => "Reverse the order of the operations in the secret handshake.",
    # }
    {
       1 => "wink",
       2 => "double blink",
       4 => "close your eyes",
       8 => "jump",
      16 => "Reverse the order of the operations in the secret handshake.",
    }
  end

  def self.commands(input : Number) # : Array(String)
    input.to_s(2).chars.map { |digit| 
      actions[digit.to_i] # actions[(digit.to_i).to_s] 
    }
  end
end

puts "actions: #{SecretHandshake.actions}"
puts "actions[1]: #{SecretHandshake.actions[1]}"
puts "actions[2]: #{SecretHandshake.actions[2]}"
puts "actions[4]: #{SecretHandshake.actions[4]}"
puts "actions[8]: #{SecretHandshake.actions[8]}"
puts "actions[16]: #{SecretHandshake.actions[16]}"
puts "1: #{SecretHandshake.commands(1)}"
puts "2: #{SecretHandshake.commands(2)}"
puts "4: #{SecretHandshake.commands(4)}"
puts "8: #{SecretHandshake.commands(8)}"
puts "16: #{SecretHandshake.commands(16)}"
puts "3: #{SecretHandshake.commands(3)}"
puts "19: #{SecretHandshake.commands(19)}"
puts "24: #{SecretHandshake.commands(24)}"
puts "16: #{SecretHandshake.commands(16)}"
