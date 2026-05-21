require "spec"
# This initially appeared as if it should have been called "../src/bellebrook_basket_league.cr"
# However, the online specs required that code called "TicketSystem",
#   so that is what I ended up using for the file name.
# I will leave it up to "exercism.org" to clean up this file naming mishap as they see fit.
require "../src/ticket_system.cr"

# describe BellebrookBasketLeague do
describe TicketSystem do
  context "Task 1" do
    it "Test 1" do
      ticket_system = TicketSystem.new(200, "Bellebrook")
      ticket_system.@tickets_available.should eq 200
      ticket_system.@stadium.should eq "Bellebrook"
    end

    it "Test 2" do
      ticket_system = TicketSystem.new(100, "Redwood")
      ticket_system.@tickets_available.should eq 100
      ticket_system.@stadium.should eq "Redwood"
    end
  end

  context "Task 2" do
    it "Test 3" do
      ticket_system = TicketSystem.new(200, "Bellebrook")
      ticket_system.tickets_available.should eq 200
    end

    it "Test 4" do
      ticket_system = TicketSystem.new(10, "Bellebrook")
      ticket_system.tickets_available.should eq 10
    end
  end

  context "Task 3" do
    it "Test 5" do
      ticket_system = TicketSystem.new(200, "Bellebrook")
      ticket_system.tickets_available.should eq 200
      ticket_system.order_ticket?.should eq true
      ticket_system.tickets_available.should eq 199
    end

    it "Test 6" do
      ticket_system = TicketSystem.new(100, "Bellebrook")
      ticket_system.tickets_available.should eq 100
      ticket_system.order_ticket?.should eq true
      ticket_system.tickets_available.should eq 99
    end

    it "Test 7" do
      ticket_system = TicketSystem.new(99, "Bellebrook")
      ticket_system.tickets_available.should eq 99
      ticket_system.order_ticket?.should eq false
      ticket_system.tickets_available.should eq 99
    end

    it "Test 8" do
      ticket_system = TicketSystem.new(10, "Bellebrook")
      ticket_system.tickets_available.should eq 10
      ticket_system.order_ticket?.should eq false
      ticket_system.tickets_available.should eq 10
    end

    it "Test 9" do
      ticket_system = TicketSystem.new(0, "Bellebrook")
      ticket_system.tickets_available.should eq 0
      ticket_system.order_ticket?.should eq false
      ticket_system.tickets_available.should eq 0
    end
  end

  context "Task 4" do
    it "Test 10" do
      expected = "John, your purchase was successful, your ticket number is #100, and the game is played at the Bellebrook stadium."

      ticket_system = TicketSystem.new(100, "Bellebrook")
      ticket_system.tickets_available.should eq 100
      ticket_system.order_message("John").should eq expected
      ticket_system.tickets_available.should eq 99
    end

    it "Test 11" do
      expected = "John, your purchase was unsuccessful, there are not enough tickets available."

      ticket_system = TicketSystem.new(10, "Bellebrook")
      ticket_system.tickets_available.should eq 10
      ticket_system.order_message("John").should eq expected
      ticket_system.tickets_available.should eq 10
    end

    it "Test 12" do
      expected = "Jane, your purchase was successful, your ticket number is #100, and the game is played at the Redwood stadium."

      ticket_system = TicketSystem.new(100, "Redwood")
      ticket_system.tickets_available.should eq 100
      ticket_system.order_message("Jane").should eq expected
      ticket_system.tickets_available.should eq 99
    end

    it "Test 13" do
      expected = "Jane, your purchase was unsuccessful, there are not enough tickets available."

      ticket_system = TicketSystem.new(5, "Redwood")
      ticket_system.tickets_available.should eq 5
      ticket_system.order_message("Jane").should eq expected
      ticket_system.tickets_available.should eq 5
    end
  end
end
