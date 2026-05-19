require "spec"
require "../src/anagram.cr"

describe Anagram do
  context "Test 1" do
    Anagram.find("diaper", ["hello", "world", "zombies", "pants"]).should eq([] of String)
  end

  context "Test 2" do
    Anagram.find("solemn", ["lemons", "cherry", "melons"]).should eq(["lemons", "melons"] of String)
  end

  context "Test 3" do
    Anagram.find("good", ["dog", "goody"]).should eq([] of String)
  end

  context "Test 4" do
    Anagram.find("listen", ["enlists", "google", "inlets", "banana"]).should eq(["inlets"] of String)
  end

  context "Test 5" do
    Anagram.find("allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"]).should eq(["gallery", "regally", "largely"] of String)
  end

  context "Test 6" do
    Anagram.find("nose", ["Eons", "ONES"]).should eq(["Eons", "ONES"] of String)
  end

  context "Test 7" do
    Anagram.find("mass", ["last"]).should eq([] of String)
  end

  context "Test 8" do
    Anagram.find("Orchestra", ["cashregister", "Carthorse", "radishes"]).should eq(["Carthorse"] of String)
  end

  context "Test 9" do
    Anagram.find("Orchestra", ["cashregister", "carthorse", "radishes"]).should eq(["carthorse"] of String)
  end

  context "Test 10" do
    Anagram.find("orchestra", ["cashregister", "Carthorse", "radishes"]).should eq(["Carthorse"] of String)
  end

  context "Test 11" do
    Anagram.find("go", ["goGoGO"]).should eq([] of String)
  end

  context "Test 12" do
    Anagram.find("tapper", ["patter"]).should eq([] of String)
  end

  context "Test 13" do
    Anagram.find("BANANA", ["BANANA"]).should eq([] of String)
  end

  context "Test 14" do
    Anagram.find("BANANA", ["Banana"]).should eq([] of String)
  end

  context "Test 15" do
    Anagram.find("BANANA", ["banana"]).should eq([] of String)
  end

  context "Test 16" do
    Anagram.find("LISTEN", ["LISTEN", "Silent"]).should eq(["Silent"] of String)
  end
end
