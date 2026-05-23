require "spec"
require "../src/isogram.cr"

# The "Results" claim we are using:...
describe Isogram do
  context "true" do
    it "Test 1" do
      Isogram.isogram?("").should eq(true)
    end

    it "Test 2" do
      Isogram.isogram?("isogram").should eq(true)
    end

    it "Test 5" do
      Isogram.isogram?("subdermatoglyphic").should eq(true)
    end

    it "Test 8" do
      Isogram.isogram?("thumbscrew-japingly").should eq(true)
    end

    it "Test 10" do
      Isogram.isogram?("six-year-old").should eq(true)
    end

    it "Test 11" do
      Isogram.isogram?("Emily Jung Schwartzkopf").should eq(true)
    end
  end

  context "false" do
    it "Test 3" do
      Isogram.isogram?("eleven").should eq(false)
    end

    it "Test 4" do
      Isogram.isogram?("zzyzx").should eq(false)
    end

    it "Test 6" do
      Isogram.isogram?("Alphabet").should eq(false)
    end

    it "Test 7" do
      Isogram.isogram?("alphAbet").should eq(false)
    end

    it "Test 9" do
      Isogram.isogram?("thumbscrew-jappingly").should eq(false)
    end

    it "Test 12" do
      Isogram.isogram?("accentor").should eq(false)
    end

    it "Test 13" do
      Isogram.isogram?("angola").should eq(false)
    end

    it "Test 14" do
      Isogram.isogram?("up-to-date").should eq(false)
    end
  end
end

# WHAT? Exercism changed the specs mid way! The "Tests" claim we are using:...
describe "Isogram" do
  context "true" do
    it "empty string" do
      Isogram.isogram?("").should eq(true)
    end

    it "isogram with only lower case characters" do
      Isogram.isogram?("isogram").should eq(true)
    end

    it "longest reported english isogram" do
      Isogram.isogram?("subdermatoglyphic").should eq(true)
    end

    it "hypothetical isogrammic word with hyphen" do
      Isogram.isogram?("thumbscrew-japingly").should eq(true)
    end

    it "isogram with duplicated hyphen" do
      Isogram.isogram?("six-year-old").should eq(true)
    end

    it "made-up name that is an isogram" do
      Isogram.isogram?("Emily Jung Schwartzkopf").should eq(true)
    end
  end
  context "false" do
    it "word with one duplicated character" do
      Isogram.isogram?("eleven").should eq(false)
    end

    it "word with one duplicated character from the end of the alphabet" do
      Isogram.isogram?("zzyzx").should eq(false)
    end

    it "word with duplicated character in mixed case" do
      Isogram.isogram?("Alphabet").should eq(false)
    end

    it "word with duplicated character in mixed case, lowercase first" do
      Isogram.isogram?("alphAbet").should eq(false)
    end

    it "hypothetical word with duplicated character following hyphen" do
      Isogram.isogram?("thumbscrew-jappingly").should eq(false)
    end

    it "duplicated character in the middle" do
      Isogram.isogram?("accentor").should eq(false)
    end

    it "same first and last characters" do
      Isogram.isogram?("angola").should eq(false)
    end

    it "word with duplicated character and with two hyphens" do
      Isogram.isogram?("up-to-date").should eq(false)
    end
  end
end
