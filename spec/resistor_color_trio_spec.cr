require "spec"

require "../src/*"

describe "ResistorColorTrio" do
  context "x ohms" do
    pending "Orange and orange and black" do
      ResistorColorTrio.label(["orange", "orange", "black"]).should eq("33 ohms")
    end

    pending "Blue and grey and brown" do
      ResistorColorTrio.label(["blue", "grey", "brown"]).should eq("680 ohms")
    end

    pending "Minimum possible value" do
      ResistorColorTrio.label(["black", "black", "black"]).should eq("0 ohms")
    end

    pending "First two colors make an invalid octal number" do
      ResistorColorTrio.label(["black", "grey", "black"]).should eq("8 ohms")
    end
  end

  context "x kiloohms" do
    pending "Red and black and red" do
      ResistorColorTrio.label(["red", "black", "red"]).should eq("2 kiloohms")
    end

    pending "Green and brown and orange" do
      ResistorColorTrio.label(["green", "brown", "orange"]).should eq("51 kiloohms")
    end

    pending "Yellow and violet and yellow" do
      ResistorColorTrio.label(["yellow", "violet", "yellow"]).should eq("470 kiloohms")
    end

    pending "Ignore extra colors" do
      ResistorColorTrio.label(["blue", "green", "yellow", "orange"]).should eq("650 kiloohms")
    end
  end

  context "x megaohms" do
    pending "Blue and violet and blue" do
      ResistorColorTrio.label(["blue", "violet", "blue"]).should eq("67 megaohms")
    end
  end

  context "x gigaohms" do
    pending "Maximum possible value" do
      ResistorColorTrio.label(["white", "white", "white"]).should eq("99 gigaohms")
    end
  end
end
