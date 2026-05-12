require "spec"
require "../src/colossal_coaster.cr"

describe ColossalCoaster do
  context "TASK 1" do
    it "Test 1" do
      express_queue = ["Tony", "Bruce"]
      normal_queue = ["RobotGuy", "WW"]
      ColossalCoaster.add_to_queue(express_queue, normal_queue, 1, "RichieRich").should eq ["Tony", "Bruce", "RichieRich"]
    end

    it "Test 2" do
      expected = ["Tony", "Bruce", "RichieRich"]
      ColossalCoaster.add_to_queue(["Tony", "Bruce"], ["RobotGuy", "WW"], 1, "RichieRich").should eq expected
    end
  end

  context "TASK 2" do
    it "Test 3" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.find_my_friend(queue, "Natasha").should eq 0
    end

    it "Test 4" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.find_my_friend(queue, "Tchalla").should eq 2
    end

    it "Test 5" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.find_my_friend(queue, "Rocket").should eq 4
    end
  end

  context "TASK 3" do
    it "Test 6" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Bucky", "Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.find_my_friend(queue, "Natasha").should eq 0
      ColossalCoaster.add_with_friends(queue, "Natasha", "Bucky").should eq expected
    end

    it "Test 7" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Natasha", "Steve", "Tchalla", "Bucky", "Wanda", "Rocket"]
      ColossalCoaster.add_with_friends(queue, "Wanda", "Bucky").should eq expected
    end

    it "Test 8" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Natasha", "Steve", "Tchalla", "Wanda", "Bucky", "Rocket"]
      ColossalCoaster.add_with_friends(queue, "Rocket", "Bucky").should eq expected
    end
  end

  context "TASK 4" do
    it "Test 9" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Natasha", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.remove_from_queue(queue, "Steve").should eq expected
    end

    it "Test 10" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Steve", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.remove_from_queue(queue, "Natasha").should eq expected
    end

    it "Test 11" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Natasha", "Steve", "Tchalla", "Wanda"]
      ColossalCoaster.remove_from_queue(queue, "Rocket").should eq expected
    end
  end

  context "TASK 5" do
    it "Test 12" do
      queue = ["Steve", "Ultron", "Natasha", "Rocket"]
      expected = ["Natasha", "Rocket", "Steve", "Ultron"]
      ColossalCoaster.sorted_queue(queue).should eq expected
    end

    it "Test 13" do
      queue = ["Steve", "Ultron", "Natasha", "Rocket", "Tchalla"]
      expected = ["Natasha", "Rocket", "Steve", "Tchalla", "Ultron"]
      ColossalCoaster.sorted_queue(queue).should eq expected
    end
  end
end
