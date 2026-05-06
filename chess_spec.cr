require "spec"
require "../src/chess.cr"

describe Chess do
  context "Task 1" do
    it "RANKS" do
      Chess::RANKS.should eq((1..8))
    end

    it "FILES" do
      Chess::FILES.should eq('A'..'H')
    end
  end

  context "Task 2" do
    it "valid_square" do
      Chess.valid_square?(1, 'A').should eq(true)
    end
  end

  context "Task 3" do
    it "nickname JOOE" do
      Chess.nickname("John", "Doe").should eq("JOOE")
    end
  end

  context "Task 4" do
    it "move_message: 'JOOE moved to A1'" do
      msg = Chess.move_message("John", "Doe", "A1")
      msg.should eq("JOOE moved to A1")
    end
  end
end
