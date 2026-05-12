require "spec"
require "../src/colossal_coaster.cr"

describe ColossalCoaster do
  context "Test 1" do
    it "test 1" do
      # coasters = ColossalCoaster.add_to_queue(express_queue, normal_queue, ticket_type, person_name)
      # coasters.should eq ["Python"]
      #
      express_queue = ["Tony", "Bruce"]
      normal_queue = ["RobotGuy", "WW"]
      ColossalCoaster.add_to_queue(express_queue, normal_queue, 1, "RichieRich").should eq ["Tony", "Bruce", "RichieRich"]
      # => ["Tony", "Bruce", "RichieRich"]
    end
  end
end
