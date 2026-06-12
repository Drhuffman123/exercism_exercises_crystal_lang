module SecretHandshake
  def self.actions
    {
       "1" => "wink",
       "2" => "double blink",
       "4" => "close your eyes",
       "8" => "jump",
      "16" => "Reverse the order of the operations in the secret handshake.",
    }
  end

  def self.commands(input : Number) # : Array(String)
    input.to_s(2).chars # .map { |digit| actions[digit.to_s] }
  end
end

puts "1: #{SecretHandshake.commands(1)}"
puts "2: #{SecretHandshake.commands(2)}"
puts "4: #{SecretHandshake.commands(4)}"
puts "8: #{SecretHandshake.commands(8)}"
puts "16: #{SecretHandshake.commands(16)}"
puts "3: #{SecretHandshake.commands(3)}"
puts "19: #{SecretHandshake.commands(19)}"
puts "24: #{SecretHandshake.commands(24)}"
puts "16: #{SecretHandshake.commands(16)}"
