require "spec"
require "../src/blackjack.cr"

describe Blackjack do
  context "Test 1" do
    it "test 1" do
      Blackjack.parse_card("ace").should eq(11)
    end

    it "test 2" do
      Blackjack.parse_card("two").should eq(2)
    end

    it "test 3" do
      Blackjack.parse_card("three").should eq(3)
    end

    it "test 4" do
      Blackjack.parse_card("four").should eq(4)
    end

    it "test 5" do
      Blackjack.parse_card("five").should eq(5)
    end

    it "test 6" do
      Blackjack.parse_card("six").should eq(6)
    end

    it "test 7" do
      Blackjack.parse_card("seven").should eq(7)
    end

    it "test 8" do
      Blackjack.parse_card("eight").should eq(8)
    end

    it "test 9" do
      Blackjack.parse_card("nine").should eq(9)
    end

    it "test 10" do
      Blackjack.parse_card("ten").should eq(10)
    end

    it "test 11" do
      Blackjack.parse_card("jack").should eq(10)
    end

    it "test 12" do
      Blackjack.parse_card("queen").should eq(10)
    end

    it "test 13" do
      Blackjack.parse_card("king").should eq(10)
    end

    it "test 14" do
      Blackjack.parse_card("joker").should eq(0)
    end
  end

  context "Test 2" do
    context "low" do
      it "test 15" do
        Blackjack.card_range("two", "two").should eq("low")
      end

      it "test 16" do
        Blackjack.card_range("three", "three").should eq("low")
      end

      it "test 17" do
        Blackjack.card_range("four", "seven").should eq("low")
      end
    end

    context "mid" do
      it "test 18" do
        Blackjack.card_range("seven", "five").should eq("mid")
      end

      it "test 19" do
        Blackjack.card_range("seven", "seven").should eq("mid")
      end

      it "test 20" do
        Blackjack.card_range("seven", "nine").should eq("mid")
      end
    end

    context "high" do
      it "test 21" do
        Blackjack.card_range("eight", "nine").should eq("high")
      end

      it "test 22" do
        Blackjack.card_range("eight", "jack").should eq("high")
      end

      it "test 23" do
        Blackjack.card_range("ten", "king").should eq("high")
      end
    end

    context "blackjack" do
      it "test 24" do
        Blackjack.card_range("ace", "ten").should eq("blackjack")
      end
    end
  end

  context "Test 3; aka which play we should choose based on cards" do
    context "check_Stand_S" do
      it "test 26" do
        Blackjack.first_turn("jack", "jack", "ace").should eq "S"
      end

      it "test 27" do
        Blackjack.first_turn("queen", "queen", "ace").should eq "S"
      end

      it "test 30" do
        Blackjack.first_turn("ace", "king", "ace").should eq "S"
      end

      it "test 31" do
        Blackjack.first_turn("jack", "ace", "queen").should eq "S"
      end

      it "test 34" do
        Blackjack.first_turn("ten", "jack", "ace").should eq "S"
      end

      it "test 35" do
        Blackjack.first_turn("nine", "king", "ace").should eq "S"
      end

      it "test 36" do
        Blackjack.first_turn("eight", "queen", "ace").should eq "S"
      end

      it "test 37" do
        Blackjack.first_turn("seven", "jack", "ace").should eq "S"
      end

      it "test 38" do
        Blackjack.first_turn("king", "six", "six").should eq "S"
      end

      it "test 41" do
        Blackjack.first_turn("king", "five", "six").should eq "S"
      end

      it "test 44" do
        Blackjack.first_turn("king", "four", "six").should eq "S"
      end

      it "test 47" do
        Blackjack.first_turn("king", "three", "six").should eq "S"
      end

      it "test 50" do
        Blackjack.first_turn("king", "two", "six").should eq "S"
      end
    end

    context "check_Hit_H" do
      it "test 28" do
        Blackjack.first_turn("two", "two", "ace").should eq "H"
      end

      it "test 29" do
        Blackjack.first_turn("five", "five", "ace").should eq "H"
      end

      it "test 39" do
        Blackjack.first_turn("six", "jack", "seven").should eq "H"
      end

      it "test 40" do
        Blackjack.first_turn("six", "jack", "ace").should eq "H"
      end

      it "test 42" do
        Blackjack.first_turn("five", "jack", "seven").should eq "H"
      end

      it "test 43" do
        Blackjack.first_turn("five", "queen", "queen").should eq "H"
      end

      it "test 45" do
        Blackjack.first_turn("four", "jack", "seven").should eq "H"
      end

      it "test 46" do
        Blackjack.first_turn("four", "queen", "queen").should eq "H"
      end

      it "test 48" do
        Blackjack.first_turn("three", "jack", "seven").should eq "H"
      end

      it "test 49" do
        Blackjack.first_turn("three", "queen", "queen").should eq "H"
      end

      it "test 51" do
        Blackjack.first_turn("two", "jack", "seven").should eq "H"
      end

      it "test 52" do
        Blackjack.first_turn("two", "queen", "queen").should eq "H"
      end

      it "test 53" do
        Blackjack.first_turn("two", "nine", "king").should eq "H"
      end

      it "test 54" do
        Blackjack.first_turn("two", "eight", "two").should eq "H"
      end

      it "test 55" do
        Blackjack.first_turn("two", "three", "queen").should eq "H"
      end

      it "test 56" do
        Blackjack.first_turn("two", "two", "five").should eq "H"
      end
    end

    context "check_Split_P" do
      it "test 25" do
        Blackjack.first_turn("ace", "ace", "ace").should eq "P"
      end
    end

    context "check_AutoWin_W" do
      it "test 32" do
        Blackjack.first_turn("ten", "ace", "five").should eq "W"
      end

      it "test 33" do
        Blackjack.first_turn("ten", "ace", "nine").should eq "W"
      end
    end
  end
end
