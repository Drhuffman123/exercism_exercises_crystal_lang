require "spec"
require "../src/rotational_cipher.cr"

describe "RotationalCipher" do
  context "wrap_to_alpha_lowercase (a's)" do
    it "a-2" do
      RotationalCipher.wrap_to_alpha_lowercase('a' - 2).should eq 'y'
    end

    it "a-1" do
      RotationalCipher.wrap_to_alpha_lowercase('a' - 1).should eq 'z'
    end

    it "a-0" do
      RotationalCipher.wrap_to_alpha_lowercase('a' + 0).should eq 'a'
    end

    it "a+1" do
      RotationalCipher.wrap_to_alpha_lowercase('a' + 1).should eq 'b'
    end

    it "a+2" do
      RotationalCipher.wrap_to_alpha_lowercase('a' + 2).should eq 'c'
    end
  end

  context "wrap_to_alpha_lowercase (z's)" do
    it "z-2" do
      RotationalCipher.wrap_to_alpha_lowercase('z' -2).should eq 'x'
    end

    it "z-1" do
      RotationalCipher.wrap_to_alpha_lowercase('z' -1).should eq 'y'
    end

    it "z+0" do
      RotationalCipher.wrap_to_alpha_lowercase('z' +0).should eq 'z'
    end

    it "z+1" do
      RotationalCipher.wrap_to_alpha_lowercase('z' + 1).should eq 'a'
    end

    it "z+2" do
      RotationalCipher.wrap_to_alpha_lowercase('z' + 2).should eq 'b'
    end
  end


  context "wrap_to_alpha_uppercase (A's)" do
    it "a-2" do
      RotationalCipher.wrap_to_alpha_uppercase('a' - 2).should eq 'Y'
    end

    it "a-1" do
      RotationalCipher.wrap_to_alpha_uppercase('a' - 1).should eq 'Z'
    end

    it "a-0" do
      RotationalCipher.wrap_to_alpha_uppercase('a' + 0).should eq 'A'
    end

    it "a+1" do
      RotationalCipher.wrap_to_alpha_uppercase('a' + 1).should eq 'B'
    end

    it "a+2" do
      RotationalCipher.wrap_to_alpha_uppercase('a' + 2).should eq 'C'
    end
  end

  context "wrap_to_alpha_uppercase (Z's)" do
    it "z-2" do
      RotationalCipher.wrap_to_alpha_uppercase('z' -2).should eq 'X'
    end

    it "z-1" do
      RotationalCipher.wrap_to_alpha_uppercase('z' -1).should eq 'Y'
    end

    it "z+0" do
      RotationalCipher.wrap_to_alpha_uppercase('z' +0).should eq 'Z'
    end

    it "z+1" do
      RotationalCipher.wrap_to_alpha_uppercase('z' + 1).should eq 'A'
    end

    it "z+2" do
      RotationalCipher.wrap_to_alpha_uppercase('z' + 2).should eq 'B'
    end
  end

  context "only_non_alpha_chars" do
    it "a" do
      RotationalCipher.only_non_alpha_chars('a').to_s.should eq ""
    end
    it "z" do
      RotationalCipher.only_non_alpha_chars('z').to_s.should eq ""
    end
    it "{" do
      RotationalCipher.only_non_alpha_chars('{').should eq '{'
    end
    it "'" do
      RotationalCipher.only_non_alpha_chars("'"[0]).should eq "'"[0]
    end
    it "!" do
      RotationalCipher.only_non_alpha_chars('!').should eq '!'
    end
    it "." do
      RotationalCipher.only_non_alpha_chars('.').should eq '.'
    end
  end

  context "rotate_lower_char" do
    pending "rotate a by 1, b" do
      RotationalCipher.rotate_lower_char('a', 1).should eq('b')
    end

    pending "rotate a by 2, c" do
      RotationalCipher.rotate_lower_char('a', 2).should eq('c')
    end

    pending "rotate a by 26, same output as input" do
      RotationalCipher.rotate_lower_char('a', 26).should eq('a')
    end

    pending "rotate n by 11, y" do
      RotationalCipher.rotate_lower_char('n', 11).should eq('y')
    end

    pending "rotate n by 12, z" do
      RotationalCipher.rotate_lower_char('n', 12).should eq('z')
    end

    pending "rotate n by 13, a" do
      RotationalCipher.rotate_lower_char('n', 13).should eq('a')
    end

    pending "rotate n by 14, b" do
      RotationalCipher.rotate_lower_char('n', 14).should eq('b')
    end

    pending "rotate n by 15, c" do
      RotationalCipher.rotate_lower_char('n', 15).should eq('c')
    end
  end

  context "rotate" do
    pending "rotate a by 0, same output as input" do
      RotationalCipher.rotate("a", 0).should eq("a")
    end

    pending "rotate a by 1" do
      RotationalCipher.rotate("a", 1).should eq("b")
      #   Expected: "b"
      #        got: "a"
    end

    pending "rotate a by 26, same output as input" do
      RotationalCipher.rotate("a", 26).should eq("a")
    end

    pending "rotate m by 13" do
      RotationalCipher.rotate("m", 13).should eq("z")
      #   Expected: "z"
      #        got: "m"
    end

    pending "rotate n by 13 with wrap around alphabet" do
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
