class LanguageList
  def self.list
    Array(String).new
  end

  def self.add(lang_list : Array(String), lang) : Array(String)
    lang_list << lang unless lang_list.includes?(lang)
    lang_list
  end

  def self.remove(lang_list : Array(String))
    lang_list.reject! { |x| x == lang_list[-1] }
    lang_list
  end

  def self.at(lang_list : Array(String), index : Int)
    lang_list[index]
  end

  def self.size(lang_list : Array(String))
    lang_list.size
  end

  def self.parse(langs : String)
    langs.split(",").map(&.strip)
  end
end
