require "spec"
require "../src/kitchen_calculator.cr"

describe KitchenCalculator do
  context "TASK 1" do
    it "Test 1" do
      KitchenCalculator.get_volume({:cup, 1}).should eq(1)
    end

    it "Test 2" do
      KitchenCalculator.get_volume({:fluid_ounce, 2}).should eq(2)
    end

    it "Test 3" do
      KitchenCalculator.get_volume({:teaspoon, 3}).should eq(3)
    end

    it "Test 4" do
      KitchenCalculator.get_volume({:tablespoon, 4}).should eq(4)
    end
    
    it "Test 5" do
      KitchenCalculator.get_volume({:milliliter, 5}).should eq(5)
    end

    it "Test 6" do
      KitchenCalculator.to_milliliter({:milliliter, 3}).should eq({:milliliter, 3})
    end

    it "Test 7" do
      KitchenCalculator.to_milliliter({:cup, 3}).should eq({:milliliter, 720})
    end
    
    it "Test 8" do
      KitchenCalculator.to_milliliter({:fluid_ounce, 100}).should eq({:milliliter, 3000})
    end

    it "Test 9" do
      KitchenCalculator.to_milliliter({:teaspoon, 3}).should eq({:milliliter, 15})
    end

    it "Test 10" do
      KitchenCalculator.to_milliliter({:tablespoon, 3}).should eq({:milliliter, 45})
    end

    it "Test 11" do
      KitchenCalculator.from_milliliter({:milliliter, 4}, :milliliter).should eq({:milliliter, 4})
    end

    it "Test 12" do
      KitchenCalculator.from_milliliter({:milliliter, 840}, :cup).should eq({:cup, 3.5})
    end

    it "Test 13" do
      KitchenCalculator.from_milliliter({:milliliter, 4522.5}, :fluid_ounce).should eq({:fluid_ounce, 150.75})
    end

    it "Test 14" do
      KitchenCalculator.from_milliliter({:milliliter, 61.25}, :teaspoon).should eq({:teaspoon, 12.25})
    end
      
    it "Test 15" do
      KitchenCalculator.from_milliliter({:milliliter, 71.25}, :tablespoon).should eq({:tablespoon, 4.75})
    end

    it "Test 16" do
      KitchenCalculator.convert({:teaspoon, 15}, :tablespoon).should eq({:tablespoon, 5})
    end

    it "Test 17" do
      KitchenCalculator.convert({:cup, 4}, :fluid_ounce).should eq({:fluid_ounce, 32})
    end

    it "Test 18" do
      KitchenCalculator.convert({:fluid_ounce, 4}, :teaspoon).should eq({:teaspoon, 24})
    end

    it "Test 19" do
      KitchenCalculator.convert({:tablespoon, 320}, :cup).should eq({:cup, 20})
    end
  end
end
