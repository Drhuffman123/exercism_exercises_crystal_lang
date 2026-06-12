module SecretHandshake
  def self.actions
    {
      1 => "wink",
      2 => "double blink",
      4 => "close your eyes",
      8 => "jump",
      16 => "Reverse the order of the operations in the secret handshake."
    }
  end

  def self.commands(input : Number) : Array(String)
    input.to_s(2).map{|digit| actions[digit]
    # ["wink"]
  end
end
