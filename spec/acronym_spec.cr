require "spec"
require "../src/acronym.cr"

describe Acronym do
  context "Task 1" do
    it "Test 1" do
      Acronym.abbreviate("Portable Network Graphics").should eq("PNG")
    end

    it "Test 2" do
      Acronym.abbreviate("Ruby on Rails").should eq("ROR")
    end

    it "Test 3" do
      Acronym.abbreviate("First In, First Out").should eq("FIFO")
    end
  end

  context "TASK 2" do
    it "Test 4" do
      Acronym.abbreviate("GNU Image Manipulation Program").should eq("GIMP")
    end

    it "Test 5" do
      Acronym.abbreviate("Complementary metal-oxide semiconductor").should eq("CMOS")
    end

    it "Test 6" do
      Acronym.abbreviate("Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me").should eq("ROTFLSHTMDCOALM")
    end
  end

  context "TASK 3" do
    it "Test 7" do
      Acronym.abbreviate("Something - I made up from thin air").should eq("SIMUFTA")
    end

    it "Test 8" do
      Acronym.abbreviate("Halley's Comet").should eq("HC")
    end

    it "Test 9" do
      Acronym.abbreviate("The Road _Not_ Taken").should eq("TRNT")
    end
  end
end
