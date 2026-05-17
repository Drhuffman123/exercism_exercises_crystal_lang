require "spec"
require "../src/spellbound_steel.cr"

describe SpellboundSteel do
  context "TASK 1" do
    it "Test 1" do
      deck = ["Warrior", "Mage", "Warrior"]
      SpellboundSteel.find_card?(deck, "Warrior").should eq(0)
    end

    it "Test 2" do
      deck = ["Warrior", "Mage", "Warrior"]
      SpellboundSteel.find_card?(deck, "Mage").should eq(1)
    end

    it "Test 3" do
      deck = ["Warrior", "Mage", "Warrior"]
      SpellboundSteel.find_card?(deck, "Rogue").should eq(nil)
    end

    it "Test 4" do
      deck = ["Warrior", "Fireball", "Mage", "Warrior"]
      SpellboundSteel.find_card?(deck, "Mage").should eq(2)
    end
  end

  context "TASK 2" do
    it "Test 5" do
      SpellboundSteel.capitalize_names([] of String).should eq([] of String)
    end

    it "Test 6" do
      SpellboundSteel.capitalize_names(["warrior", "mage", "rogue"]).should eq(["Warrior", "Mage", "Rogue"])
    end

    it "Test 7" do
      SpellboundSteel.capitalize_names(["warrior", "mage", "rogue", "fireball", "ice storm", "lightning bolt"]).should eq(["Warrior", "Mage", "Rogue", "Fireball", "Ice Storm", "Lightning Bolt"])
    end
  end

  context "TASK 3" do
    it "Test 8" do
      deck = [] of String
      SpellboundSteel.calculate_power_level(deck).should eq(0)
    end

    it "Test 9" do
      deck = ["Warrior"]
      SpellboundSteel.calculate_power_level(deck).should eq(10)
    end

    it "Test 10" do
      deck = ["Mage"]
      SpellboundSteel.calculate_power_level(deck).should eq(20)
    end

    it "Test 11" do
      deck = ["Warrior", "Mage"]
      SpellboundSteel.calculate_power_level(deck).should eq(30)
    end

    it "Test 12" do
      deck = ["Lightning Bolt"]
      SpellboundSteel.calculate_power_level(deck).should eq(35)
    end

    it "Test 13" do
      deck = ["Rogue", "Ice Storm"]
      SpellboundSteel.calculate_power_level(deck).should eq(55)
    end

    it "Test 14" do
      deck = ["Warrior", "Mage", "Rogue", "Fireball", "Ice Storm", "Lightning Bolt"]
      SpellboundSteel.calculate_power_level(deck).should eq(135)
    end
  end

  context "TASK 4" do
    it "Test 15" do
      SpellboundSteel.decode_characters("").should eq("")
    end

    it "Test 16" do
      SpellboundSteel.decode_characters("wbalrrrlimoqr").should eq("warrior")
    end

    it "Test 17" do
      SpellboundSteel.decode_characters("mlabgle").should eq("mage")
    end

    it "Test 18" do
      SpellboundSteel.decode_characters("rloggquge").should eq("rogue")
    end
  end
end
