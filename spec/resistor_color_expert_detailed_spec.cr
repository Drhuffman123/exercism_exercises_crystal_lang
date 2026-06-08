require "spec"

# require "../src/resistor.cr"
require "../src/resistor_color_expert.cr"

describe "ResistorColorExpert" do
  context "single" do
    it "Black" do
      ResistorColor.color_code("black").should eq(0)
    end

    it "White" do
      ResistorColor.color_code("white").should eq(9)
    end

    it "Orange" do
      ResistorColor.color_code("orange").should eq(3)
    end

    it "Colors" do
      ResistorColor.colors.should eq(["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"])
    end
  end

  context "duo" do
    pending "Brown and black" do
      ResistorColorExpert.resistor_label(["brown", "black"]).should eq("10")
    end

    pending "Blue and grey" do
      ResistorColorExpert.resistor_label(["blue", "grey"]).should eq(68)
    end

    pending "Yellow and violet" do
      ResistorColorExpert.resistor_label(["yellow", "violet"]).should eq(47)
    end
  end

  context "trio" do
    context "x ohms" do
      it "Orange and orange and black" do
        ResistorColorExpert.resistor_label(["orange", "orange", "black"]).should eq("33 ohms")
      end

      pending "Blue and grey and brown" do
        ResistorColorExpert.resistor_label(["blue", "grey", "brown"]).should eq("680 ohms")
      end

      it "Minimum possible value" do
        ResistorColorExpert.resistor_label(["black", "black", "black"]).should eq("0 ohms")
      end

      it "First two colors make an invalid octal number" do
        ResistorColorExpert.resistor_label(["black", "grey", "black"]).should eq("8 ohms")
      end
    end
  end

  context "expert" do
    context "1x" do
      it "One black band" do
        ResistorColorExpert.resistor_label(["black"]).should eq("0 ohms")
      end
    end

    context "4x" do
      pending "Orange, orange, black, and red" do
        ResistorColorExpert.resistor_label(["orange", "orange", "black", "red"]).should eq("33 ohms ±2%")
      end

      pending "Blue, grey, brown, and violet" do
        ResistorColorExpert.resistor_label(["blue", "grey", "brown", "violet"]).should eq("680 ohms ±0.1%")
      end

      pending "Red, black, red, and green" do
        ResistorColorExpert.resistor_label(["red", "black", "red", "green"]).should eq("2 kiloohms ±0.5%")
      end

      pending "Green, brown, orange, and grey" do
        ResistorColorExpert.resistor_label(["green", "brown", "orange", "grey"]).should eq("51 kiloohms ±0.05%")
      end

      pending "Violet, orange, red, and grey" do
        ResistorColorExpert.resistor_label(["violet", "orange", "red", "grey"]).should eq("7.3 kiloohms ±0.05%")
      end
    end

    context "5x" do
      pending "Orange, orange, yellow, black, and brown" do
        ResistorColorExpert.resistor_label(["orange", "orange", "yellow", "black", "brown"]).should eq("334 ohms ±1%")
      end

      pending "Red, green, yellow, yellow, and brown" do
        ResistorColorExpert.resistor_label(["red", "green", "yellow", "yellow", "brown"]).should eq("2.54 megaohms ±1%")
      end

      pending "Blue, grey, white, brown, and brown" do
        ResistorColorExpert.resistor_label(["blue", "grey", "white", "brown", "brown"]).should eq("6.89 kiloohms ±1%")
      end

      pending "Brown, red, orange, green, and blue" do
        ResistorColorExpert.resistor_label(["brown", "red", "orange", "green", "blue"]).should eq("12.3 megaohms ±0.25%")
      end
    end
  end
end
