require "spec"
require "../src/chess.cr"

describe Chess do
  context "Task 1" do
    it "Test 1" do
      Chess::FILES.should eq 'A'..'H'
    end

    it "Test 2" do
      Chess::RANKS.should eq 1..8
    end
  end

  context "Task 2" do
    it "Test 3" do
      Chess.valid_square?(1, 'A').should be_true
    end

    it "Test 4" do
      Chess.valid_square?(8, 'H').should be_true
    end

    it "Test 5" do
      Chess.valid_square?(9, 'B').should be_false
    end

    it "Test 6" do
      Chess.valid_square?(1, 'I').should be_false
    end

    it "Test 7" do
      Chess.valid_square?(0, 'A').should be_false
    end
  end

  context "Task 3" do
    it "Test 8" do
      Chess.nickname("John", "Doe").should eq "JOOE"
    end

    it "Test 9" do
      Chess.nickname("Lisa", "Li").should eq "LILI"
    end

    it "Test 10" do
      Chess.nickname("Dj", "Walker").should eq "DJER"
    end
  end

  context "Task 4" do
    it "Test 11" do
      Chess.move_message("John", "Doe", "A2").should eq "JOOE moved to A2"
    end

    it "Test 12" do
      Chess.move_message("Lisa", "Li", "H8").should eq "LILI moved to H8"
    end

    it "Test 13" do
      Chess.move_message("Dj", "Walker", "I9").should eq "DJER attempted to move to I9, but that is not a valid square"
    end

    it "Test 14" do
      Chess.move_message("Tore", "Anderson", "A0").should eq "TOON attempted to move to A0, but that is not a valid square"
    end
  end
end
