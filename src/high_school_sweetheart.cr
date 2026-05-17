class HighSchoolSweetheart
  def self.clean_up_name(name)
    name.gsub("-", " ").strip
  end

  def self.first_letter(name)
    names = clean_up_name(name).split
    name_first = names[0]
    name_first[0]
  end

  def self.initial(name)
    names : Array(String) = clean_up_name(name).split
    first_name = names[0]
    first_name[0].upcase + "."
  end

  def self.pair(name1, name2)
    "❤ #{initial(name1)}  +  #{initial(name2)} ❤"
  end
end
