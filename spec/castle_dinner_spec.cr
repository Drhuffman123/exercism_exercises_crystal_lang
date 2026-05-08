# CastleDinner
require "spec"
require "../src/castle_dinner.cr"

describe CastleDinner do
  context "Task 1" do
    it "Test 1" do
      CastleDinner.check_food?("Mushroom pasties").should eq "Mushroom pasties"
    end

    it "Test 2" do
      CastleDinner.check_food?("Cabbage chowder").should eq nil
    end

    it "Test 3" do
      CastleDinner.check_food?("Roast venison").should eq nil
    end
  end

  context "Task 2" do
    it "Test 4" do
      CastleDinner.check_drink?("Apple juice").should eq "Apple juice"
    end

    it "Test 5" do
      CastleDinner.check_drink?("Elderberry juice").should eq "Elderberry juice"
    end

    it "Test 6" do
      CastleDinner.check_drink?("Water").should eq nil
    end

    it "Test 7" do
      CastleDinner.check_drink?("Ale").should eq nil
    end

    it "Test 8" do
      CastleDinner.check_drink?("Iced tea").should eq "Iced tea"
    end
  end

  context "Task 3" do
    it "Test 9" do
      CastleDinner.replace_drink("Elderberry juice").should eq "Elderberry juice"
    end

    it "Test 10" do
      CastleDinner.replace_drink("Water").should eq "Apple juice"
    end

    it "Test 11" do
      CastleDinner.replace_drink("Ale").should eq "Apple juice"
    end
  end
end
