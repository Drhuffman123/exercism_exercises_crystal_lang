require "spec"
require "../src/hamming.cr"

describe "Hamming" do
  context "distance eq 0" do
    it "Test 1" do
      Hamming.distance("", "").should eq(0)
    end

    it "Test 2" do
      Hamming.distance("A", "A").should eq(0)
    end

    it "Test 4" do
      Hamming.distance("GGACTGAAATCTG", "GGACTGAAATCTG").should eq(0)
    end
  end

  context "distance eq positive int" do
    it "Test 3" do
      Hamming.distance("G", "T").should eq(1)
    end

    it "Test 5" do
      Hamming.distance("GGACGGATTCTG", "AGGACGGATTCT").should eq(9)
    end
  end

  context "distance raises" do
    it "Test 6" do
      expect_raises(ArgumentError) do
        Hamming.distance("AATG", "AAA")
      end
    end

    it "Test 7" do
      expect_raises(ArgumentError) do
        Hamming.distance("ATA", "AGTG")
      end
    end

    it "Test 8" do
      expect_raises(ArgumentError) do
        Hamming.distance("", "G")
      end
    end

    it "Test 9" do
      expect_raises(ArgumentError) do
        Hamming.distance("G", "")
      end
    end
  end
end
