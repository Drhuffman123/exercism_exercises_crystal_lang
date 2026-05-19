module Acronym
  def self.abbreviate(phrase : String) : String
    phrase.split(/[ _-]+/).map { |segment| segment.capitalize.to_s[0] }.join
  end
end
