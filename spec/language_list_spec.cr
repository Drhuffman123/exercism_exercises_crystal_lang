require "spec"
require "../src/language_list.cr"

describe LanguageList do
  context "Test 1" do
    it "test 1" do
      language_list = LanguageList.list
      language_list.should eq [] of String
    end
  end

  context "TASK 2" do
    it "test 2" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      language_list.should eq ["Crystal"]
    end

    it "test 3" do
      language_list = LanguageList.list
      # language_list = LanguageList.add(language_list, "Crystal")
      language_list = LanguageList.add(language_list, "Ruby")
      language_list = LanguageList.add(language_list, "C#")
      language_list = LanguageList.add(language_list, "Java")
      language_list.should eq ["Crystal", "Ruby", "C#", "Java"]
    end
  end

  context "TASK 3" do
    it "test 4" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      language_list = LanguageList.remove(language_list)
      language_list.should eq [] of String
    end

    it "test 5" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      language_list = LanguageList.add(language_list, "Ruby")
      language_list = LanguageList.remove(language_list)
      language_list.should eq ["Crystal"]
    end
  end

  context "TASK 4" do
    it "test 6" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      LanguageList.at(language_list, 0).should eq "Crystal"
    end

    it "test 7" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      language_list = LanguageList.add(language_list, "Ruby")
      language_list = LanguageList.add(language_list, "C#")
      language_list = LanguageList.add(language_list, "Java")
      LanguageList.at(language_list, 1).should eq "Ruby"
    end

    it "test 8" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      language_list = LanguageList.add(language_list, "Ruby")
      language_list = LanguageList.add(language_list, "C#")
      language_list = LanguageList.add(language_list, "Java")
      LanguageList.at(language_list, 3).should eq "Java"
    end
  end

  context "TASK 5" do
    it "test 9" do
      language_list = LanguageList.parse("Crystal")
      language_list.should eq ["Crystal"]
    end

    it "test 10" do
      language_list = LanguageList.parse("Crystal, Ruby, C#, Java")
      language_list.should eq ["Crystal", "Ruby", "C#", "Java"]
    end

    it "test 11" do
      language_list = LanguageList.parse("Crystal, Ruby, C#, Visual Basic, Java, C++")
      language_list.should eq ["Crystal", "Ruby", "C#", "Visual Basic", "Java", "C++"]
    end
  end
end
