require "spec"
require "../src/highSchool_sweetheart.cr"

describe HighSchoolSweetheart do
  context "Task 1" do
    it "Test 1" do
      HighSchoolSweetheart.clean_up_name("John-Doe").should eq "John Doe"
    end

    it "Test 2" do
      HighSchoolSweetheart.clean_up_name("-John-Doe-").should eq "John Doe"
    end
  end

  context "TASK 2" do
    it "Test 3" do
      HighSchoolSweetheart.first_letter("Marry").to_s.should eq "M"
    end

    it "Test 4" do
      HighSchoolSweetheart.first_letter("john").to_s.should eq "j"
    end

    it "Test 5" do
      HighSchoolSweetheart.first_letter("\n\t   -Sarah-   ").to_s.should eq "S"
    end
  end

  context "TASK 3" do
    it "Test 6" do
      HighSchoolSweetheart.initial("Betty").should eq "B."
    end

    it "Test 7" do
      HighSchoolSweetheart.initial("james").should eq "J."
    end
  end

  context "TASK 4" do
    it "Test 8" do
      expected = "❤ A.  +  C. ❤"
      HighSchoolSweetheart.pair("Avery", "Charlie").should eq expected
    end
  end
end
