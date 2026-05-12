class LanguageList
  @@langs_listed = Array(String).new
  
  def self.list()
    @@langs_listed
  end

  def self.add(lang_list : Array(String), lang)
    lang_list << lang
  end

  def self.remove(index)
    @@langs_listed.delete(index)
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
