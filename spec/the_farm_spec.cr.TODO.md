require "spec"
require "../src/the_farm.cr"

describe TheFarm do
  context "TASK 1" do
    it "Test 1" do
      food = FodderCalculator.new(100, 1)
      TheFarm.divide_food(food, 10).should eq 10
    end

    it "Test 2" do
      food = FodderCalculator.new(60.5, 1.3)
      TheFarm.divide_food(food, 5).should eq 15.73
    end
  end

  context "TASK 2" do
    it "Test 3" do
      food = FodderCalculator.new(nil, 100)
      TheFarm.divide_food(food, 10).should eq 0
    end

    it "Test 4" do
      food = FodderCalculator.new(1000, nil)
      TheFarm.divide_food(food, 10).should eq 0
    end
  end

  context "TASK 3" do
    it "Test 5" do
      expect_raises(Exception, "Number of cows must be greater than 0") do
        TheFarm.validate_input_and_divide_food(FodderCalculator.new(10, 1), -10)
      end
    end

    it "Test 6" do
      expect_raises(Exception, "Number of cows must be greater than 0") do
        TheFarm.validate_input_and_divide_food(FodderCalculator.new(10, 1), 0)
      end
    end

    it "Test 7" do
      food = FodderCalculator.new(100, 1)
      TheFarm.validate_input_and_divide_food(food, 10).should eq 10
    end

    it "Test 8" do
      food = FodderCalculator.new(60.5, 1.3)
      TheFarm.validate_input_and_divide_food(food, 5).should eq 15.73
    end

    it "Test 9" do
      food = FodderCalculator.new(nil, 100)
      TheFarm.validate_input_and_divide_food(food, 10).should eq 0
    end

    it "Test 10" do
      food = FodderCalculator.new(1000, nil)
      TheFarm.validate_input_and_divide_food(food, 10).should eq 0
    end
  end

  context "TASK 4" do
    it "Test 11" do
      TheFarm.validate_number_of_cows(80).should eq nil
    end

    it "Test 12" do
      TheFarm.validate_number_of_cows(1).should eq nil
    end

    it "Test 13" do
      expect_raises(InvalidCowsError, "-20 cows are invalid: there are no negative cows") do
        TheFarm.validate_number_of_cows(-20)
      end
    end

    it "Test 14" do
      expect_raises(InvalidCowsError, "-1 cows are invalid: there are no negative cows") do
        TheFarm.validate_number_of_cows(-1)
      end
    end

    it "Test 15" do
      expect_raises(InvalidCowsError, "0 cows are invalid: no cows don't need food") do
        TheFarm.validate_number_of_cows(0)
      end
    end
  end
end
