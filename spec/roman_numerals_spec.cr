require "spec"
require "../src/roman_numerals.cr"

describe "RomanNumerals" do
  context "1..9" do
    it "1 is I" do
      1.to_roman.should eq("I")
    end

    it "2 is II" do
      2.to_roman.should eq("II")
    end

    it "3 is III" do
      3.to_roman.should eq("III")
    end

    it "4 is IV" do
      4.to_roman.should eq("IV")
    end

    it "5 is V" do
      5.to_roman.should eq("V")
    end

    it "6 is VI" do
      6.to_roman.should eq("VI")
    end

    it "9 is IX" do
      9.to_roman.should eq("IX")
    end
  end

  context "10...99" do
    it "16 is XVI" do
      16.to_roman.should eq("XVI")
    end

    it "27 is XXVII" do
      27.to_roman.should eq("XXVII")
    end

    it "48 is XLVIII" do
      48.to_roman.should eq("XLVIII")
    end

    it "49 is XLIX" do
      49.to_roman.should eq("XLIX")
    end

    it "59 is LIX" do
      59.to_roman.should eq("LIX")
    end

    it "66 is LXVI" do
      66.to_roman.should eq("LXVI")
    end

    it "93 is XCIII" do
      93.to_roman.should eq("XCIII")
    end
  end

  context "100..999" do
    it "141 is CXLI" do
      141.to_roman.should eq("CXLI")
    end

    it "163 is CLXIII" do
      163.to_roman.should eq("CLXIII")
    end

    it "166 is CLXVI" do
      166.to_roman.should eq("CLXVI")
    end

    it "402 is CDII" do
      402.to_roman.should eq("CDII")
    end

    it "575 is DLXXV" do
      575.to_roman.should eq("DLXXV")
    end

    it "666 is DCLXVI" do
      666.to_roman.should eq("DCLXVI")
    end

    it "911 is CMXI" do
      911.to_roman.should eq("CMXI")
    end
  end

  context "1000.." do
    it "1024 is MXXIV" do
      1024.to_roman.should eq("MXXIV")
    end

    it "1666 is MDCLXVI" do
      1666.to_roman.should eq("MDCLXVI")
    end

    it "3000 is MMM" do
      3000.to_roman.should eq("MMM")
    end

    it "3001 is MMMI" do
      3001.to_roman.should eq("MMMI")
    end

    it "3888 is MMMDCCCLXXXVIII" do
      3888.to_roman.should eq("MMMDCCCLXXXVIII")
    end

    it "3999 is MMMCMXCIX" do
      3999.to_roman.should eq("MMMCMXCIX")
    end
  end

  context "a bit more" do
    it "4999 is MMMMCMXCIX" do
      4999.to_roman.should eq("MMMMCMXCIX")
    end

    it "5999 is MMMMMCMXCIX" do
      5999.to_roman.should eq("MMMMMCMXCIX")
    end

    it "6999 is MMMMMMCMXCIX" do
      6999.to_roman.should eq("MMMMMMCMXCIX")
    end
  end
end
