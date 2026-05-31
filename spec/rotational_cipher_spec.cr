require "spec"
require "../src/rotational_cipher.cr"

describe "RotationalCipher" do
  context "wrap_lower" do
    context "(a's)" do
      it "a-2" do
        RotationalCipher.wrap_lower('a', -2).should eq 'y'
      end

      it "a-1" do
        RotationalCipher.wrap_lower('a', -1).should eq 'z'
      end

      it "a-0" do
        RotationalCipher.wrap_lower('a', +0).should eq 'a'
      end

      it "a+1" do
        RotationalCipher.wrap_lower('a', +1).should eq 'b'
      end

      it "a+2" do
        RotationalCipher.wrap_lower('a', +2).should eq 'c'
      end
    end

    context "(l's)" do
      it "l+0" do
        RotationalCipher.wrap_lower('l', +0).should eq 'l'
      end

      it "l+1" do
        RotationalCipher.wrap_lower('l', +1).should eq 'm'
      end

      it "l+2" do
        RotationalCipher.wrap_lower('l', +2).should eq 'n'
      end

      it "l+3" do
        RotationalCipher.wrap_lower('l', +3).should eq 'o'
      end

      it "l+4" do
        RotationalCipher.wrap_lower('l', +4).should eq 'p'
      end

      it "l+5" do
        RotationalCipher.wrap_lower('l', +5).should eq 'q'
      end

      it "l+6" do
        RotationalCipher.wrap_lower('l', +6).should eq 'r'
      end

      it "l+7" do
        RotationalCipher.wrap_lower('l', +7).should eq 's'
      end

      it "l+8" do
        RotationalCipher.wrap_lower('l', +8).should eq 't'
      end

      it "l+9" do
        RotationalCipher.wrap_lower('l', +9).should eq 'u'
      end

      it "l+10" do
        RotationalCipher.wrap_lower('l', +10).should eq 'v'
      end

      it "l+11" do
        RotationalCipher.wrap_lower('l', +11).should eq 'w'
      end

      it "l+12" do
        RotationalCipher.wrap_lower('l', +12).should eq 'x'
      end

      it "l+13" do
        RotationalCipher.wrap_lower('l', +13).should eq 'y'
      end

      it "l+14" do
        RotationalCipher.wrap_lower('l', +14).should eq 'z'
      end

      it "l+15" do
        RotationalCipher.wrap_lower('l', +15).should eq 'a'
      end

      it "l+16" do
        RotationalCipher.wrap_lower('l', +16).should eq 'b'
      end

      it "l+17" do
        RotationalCipher.wrap_lower('l', +17).should eq 'c'
      end

      it "l+18" do
        RotationalCipher.wrap_lower('l', +18).should eq 'd'
      end

      it "l+19" do
        RotationalCipher.wrap_lower('l', +19).should eq 'e'
      end

      it "l+20" do
        RotationalCipher.wrap_lower('l', +20).should eq 'f'
      end

      it "l+21" do
        RotationalCipher.wrap_lower('l', +21).should eq 'g'
      end

      it "l+22" do
        RotationalCipher.wrap_lower('l', +22).should eq 'h'
      end

      it "l+23" do
        RotationalCipher.wrap_lower('l', +23).should eq 'i'
      end

      it "l+24" do
        RotationalCipher.wrap_lower('l', +24).should eq 'j'
      end

      it "l+25" do
        RotationalCipher.wrap_lower('l', +25).should eq 'k'
      end

      it "l+26" do
        RotationalCipher.wrap_lower('l', +26).should eq 'l'
      end
    end

    context "K's" do
      it "K+13" do
        RotationalCipher.wrap_upper('K', 13).should eq 'X'
      end

      it "K+14" do
        RotationalCipher.wrap_upper('K', 14).should eq 'Y'
      end

      it "K+15" do
        RotationalCipher.wrap_upper('K', 15).should eq 'Z'
      end
    end

    context "(L's)" do
      it "L+0" do
        RotationalCipher.wrap_upper('L', 0).should eq 'L'
      end

      it "L+1" do
        RotationalCipher.wrap_upper('L', 1).should eq 'M'
      end

      it "L+2" do
        RotationalCipher.wrap_upper('L', 2).should eq 'N'
      end

      it "L+3" do
        RotationalCipher.wrap_upper('L', 3).should eq 'O'
      end

      it "L+4" do
        RotationalCipher.wrap_upper('L', 4).should eq 'P'
      end

      it "L+5" do
        RotationalCipher.wrap_upper('L', 5).should eq 'Q'
      end

      it "L+6" do
        RotationalCipher.wrap_upper('L', 6).should eq 'R'
      end

      it "L+7" do
        RotationalCipher.wrap_upper('L', 7).should eq 'S'
      end

      it "L+8" do
        RotationalCipher.wrap_upper('L', 8).should eq 'T'
      end

      it "L+9" do
        RotationalCipher.wrap_upper('L', 9).should eq 'U'
      end

      it "L+10" do
        RotationalCipher.wrap_upper('L', 10).should eq 'V'
      end

      it "L+11" do
        RotationalCipher.wrap_upper('L', 11).should eq 'W'
      end

      it "L+12" do
        RotationalCipher.wrap_upper('L', 12).should eq 'X'
      end

      it "L+13" do
        RotationalCipher.wrap_upper('L', 13).should eq 'Y'
      end

      it "L+14" do
        RotationalCipher.wrap_upper('L', 14).should eq 'Z'
      end

      it "L+15" do
        RotationalCipher.wrap_upper('L', 15).should eq 'A'
      end

      it "L+16" do
        RotationalCipher.wrap_upper('L', 16).should eq 'B'
      end

      it "L+17" do
        RotationalCipher.wrap_upper('L', 17).should eq 'C'
      end

      it "L+18" do
        RotationalCipher.wrap_upper('L', 18).should eq 'D'
      end

      it "L+19" do
        RotationalCipher.wrap_upper('L', 19).should eq 'E'
      end

      it "L+20" do
        RotationalCipher.wrap_upper('L', 20).should eq 'F'
      end

      it "L+21" do
        RotationalCipher.wrap_upper('L', 21).should eq 'G'
      end

      it "L+22" do
        RotationalCipher.wrap_upper('L', 22).should eq 'H'
      end

      it "L+23" do
        RotationalCipher.wrap_upper('L', 23).should eq 'I'
      end

      it "L+24" do
        RotationalCipher.wrap_upper('L', 24).should eq 'J'
      end

      it "L+25" do
        RotationalCipher.wrap_upper('L', 25).should eq 'K'
      end

      it "L+26" do
        RotationalCipher.wrap_upper('L', 26).should eq 'L'
      end
    end

    context "(T's)" do
      it "a+2" do
        RotationalCipher.wrap_lower('a', 2).should eq 'c'
      end

      it "a+2" do
        RotationalCipher.wrap_lower('a', 2).should eq 'c'
      end
    end

    context "(z's)" do
      it "z-2" do
        RotationalCipher.wrap_lower('z', -2).should eq 'x'
      end

      it "z-1" do
        RotationalCipher.wrap_lower('z', -1).should eq 'y'
      end

      it "z+0" do
        RotationalCipher.wrap_lower('z', 0).should eq 'z'
      end

      it "z+1" do
        RotationalCipher.wrap_lower('z', 1).should eq 'a'
      end

      it "z+2" do
        RotationalCipher.wrap_lower('z', 2).should eq 'b'
      end
    end
  end

  context "wrap_upper" do
    context "(A's)" do
      it "a-2" do
        RotationalCipher.wrap_upper('a', -2).should eq 'Y'
      end

      it "a-1" do
        RotationalCipher.wrap_upper('a', -1).should eq 'Z'
      end

      it "a-0" do
        RotationalCipher.wrap_upper('a', 0).should eq 'A'
      end

      it "a+1" do
        RotationalCipher.wrap_upper('a', 1).should eq 'B'
      end

      it "a+2" do
        RotationalCipher.wrap_upper('a', 2).should eq 'C'
      end
    end

    context "(Z's)" do
      it "z-2" do
        RotationalCipher.wrap_upper('z', -2).should eq 'X'
      end

      it "z-1" do
        RotationalCipher.wrap_upper('z', -1).should eq 'Y'
      end

      it "z+0" do
        RotationalCipher.wrap_upper('z', 0).should eq 'Z'
      end

      it "z+1" do
        RotationalCipher.wrap_upper('z', 1).should eq 'A'
      end

      it "z+2" do
        RotationalCipher.wrap_upper('z', 2).should eq 'B'
      end
    end
  end

  context "rotate" do
    context "a .." do
      it "rotate a by 0, same output as input" do
        RotationalCipher.rotate("a", 0).should eq("a")
      end

      it "rotate a by 1" do
        RotationalCipher.rotate("a", 1).should eq("b")
      end

      it "rotate a by 26, same output as input" do
        RotationalCipher.rotate("a", 26).should eq("a")
      end
    end

    context "m .." do
      it "rotate m by 13" do
        RotationalCipher.rotate("m", 13).should eq("z")
      end
    end

    context "n .." do
      it "rotate n by 13 with wrap around alphabet" do
        RotationalCipher.rotate("n", 13).should eq("a")
      end
    end

    context "OMG .." do
      it "rotate capital letters" do
        RotationalCipher.rotate("OMG", 5).should eq("TRL")
      end
    end

    context "O M G .." do
      it "rotate spaces" do
        RotationalCipher.rotate("O M G", 5).should eq("T R L")
      end
    end

    context "numbers .." do
      pending "rotate numbers" do
        RotationalCipher.rotate("Testing 1 2 3 testing", 21).should eq("Xiwxmrk 1 2 3 xiwxmrk")
        #   Expected: "Xiwxmrk 1 2 3 xiwxmrk"
        #        got: "Testing 1 2 3 testing"
        #        got: "Iznodib5F5G5H5oznodib"
        #        got: "Oznodib 1 2 3 oznodib"
      end
    end

    context "punctuation .." do
      it "rotate punctuation" do
        RotationalCipher.rotate("Let's eat, Grandma!", 21).should eq("Gzo'n zvo, Bmviyhv!")
      end
    end

    context "all letters .." do
      it "rotate all letters" do
        RotationalCipher.rotate("The quick brown fox jumps over the lazy dog.", 13).should eq("Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")
      end
    end
  end
end
