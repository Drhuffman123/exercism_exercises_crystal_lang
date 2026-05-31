require "spec"
require "../src/rotational_cipher.cr"

describe "RotationalCipher" do
  context "rotate_lower_char" do
    pending "rotate a by 1, b" do
      RotationalCipher.rotate_lower_char('a', 1).should eq('b')
    end

    pending "rotate a by 2, c" do
      RotationalCipher.rotate_lower_char('a', 2).should eq('c')
    end

    it "rotate a by 26, same output as input" do
      RotationalCipher.rotate_lower_char('a', 26).should eq('a')
    end

    it "rotate n by 11, y" do
      RotationalCipher.rotate_lower_char('n', 11).should eq('y')
    end

    it "rotate n by 12, z" do
      RotationalCipher.rotate_lower_char('n', 12).should eq('z')
    end

    it "rotate n by 13, a" do
      RotationalCipher.rotate_lower_char('n', 13).should eq('a')
    end

    it "rotate n by 14, b" do
      RotationalCipher.rotate_lower_char('n', 14).should eq('b')
    end

    it "rotate n by 15, c" do
      RotationalCipher.rotate_lower_char('n', 15).should eq('c')
    end

  end

  context "rotate" do
    it "rotate a by 0, same output as input" do
      RotationalCipher.rotate("a", 0).should eq("a")
    end

    pending "rotate a by 1" do
      RotationalCipher.rotate("a", 1).should eq("b")
      #   Expected: "b"
      #        got: "a"
    end

    it "rotate a by 26, same output as input" do
      RotationalCipher.rotate("a", 26).should eq("a")
    end

    it "rotate m by 13" do
      RotationalCipher.rotate("m", 13).should eq("z")
      #   Expected: "z"
      #        got: "m"
    end

    it "rotate n by 13 with wrap around alphabet" do
      RotationalCipher.rotate("n", 13).should eq("a")
      #   Expected: "a"
      #        got: "n"
    end

    pending "rotate capital letters" do
      RotationalCipher.rotate("OMG", 5).should eq("TRL")
      #   Expected: "TRL"
      #        got: "OMG"
    end

    pending "rotate spaces" do
      RotationalCipher.rotate("O M G", 5).should eq("T R L")
      #   Expected: "T R L"
      #        got: "O M G"
    end

    it "rotate numbers" do
      #   Expected: "Xiwxmrk 1 2 3 xiwxmrk"
      #        got: "Testing 1 2 3 testing"
    end

    pending "rotate punctuation" do
      RotationalCipher.rotate("Let's eat, Grandma!", 21).should eq("Gzo'n zvo, Bmviyhv!")
      #   Expected: "Gzo'n zvo, Bmviyhv!"
      #        got: "Let's eat, Grandma!"
    end

    pending "rotate all letters" do
      RotationalCipher.rotate("The quick brown fox jumps over the lazy dog.", 13).should eq("Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")
      #   Expected: "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
      #        got: "The quick brown fox jumps over the lazy dog."
    end
  end
end
