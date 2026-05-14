require "spec"
require "../src/foto_fusionist.cr"

describe TheFarm do
  context "TASK 1" do
    it "Test 1" do
      FotoFusionist.binary_to_int("00000001").should eq 1
    end

    it "Test 2" do
      FotoFusionist.binary_to_int("00000010").should eq 2
    end

    it "Test 3" do
      FotoFusionist.binary_to_int("11010011").should eq 211
    end
  end

  context "TASK 2" do
    it "Test 4" do
      FotoFusionist.least_significant_bit(0b1).should eq 1
    end

    it "Test 5" do
      FotoFusionist.least_significant_bit(0b0).should eq 0
    end

    it "Test 6" do
      FotoFusionist.least_significant_bit(0b10).should eq 0
    end
  end

  context "TASK 3" do
    it "Test 7" do
      FotoFusionist.hex_value(19).should eq "13"
    end

    it "Test 8" do
      FotoFusionist.hex_value(0).should eq "00"
    end

    it "Test 9" do
      FotoFusionist.hex_value(255).should eq "ff"
    end

    it "Test 10" do
      FotoFusionist.hex_value(128).should eq "80"
    end
  end

  context "TASK 4" do
    it "Test 11" do
      FotoFusionist.hex_value_from_rgb(0, 0, 0).should eq "000000"
    end

    it "Test 12" do
      FotoFusionist.hex_value_from_rgb(255, 255, 255).should eq "ffffff"
    end

    it "Test 13" do
      FotoFusionist.hex_value_from_rgb(255, 0, 0).should eq "ff0000"
    end

    it "Test 14" do
      FotoFusionist.hex_value_from_rgb(128, 55, 30).should eq "80371e"
    end

    it "Test 15" do
      FotoFusionist.hex_value_from_rgb(20, 232, 179).should eq "14e8b3"
    end
  end
end
