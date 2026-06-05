module TwoFer
  def self.two_fer(name : String? = nil)
    "One for #{name || "you"}, one for me."
  end
end
