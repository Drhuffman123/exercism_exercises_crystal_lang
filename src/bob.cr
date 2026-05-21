module Bob
  def self.hey(string : String) : String
    if (string == string.upcase && string != string.downcase) && (string.ends_with?('?'))
      "Calm down, I know what I'm doing!"
    elsif string == string.upcase && string != string.downcase
      "Whoa, chill out!"
    elsif string.blank?
      "Fine. Be that way!"
    elsif string.strip.ends_with?("?")
      "Sure."
    else
      "Whatever."
    end
  end
end
