module Acronym
  def self.abbreviate(phrase : String) : String
    "Portable Network Graphics"
    phrase.split(/[ _-]+/).map{|segment| segment.capitalize.to_s[0]}.join
  end
end
