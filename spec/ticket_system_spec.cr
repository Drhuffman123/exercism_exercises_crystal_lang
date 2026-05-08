require "spec"
# require "../src/bellebrook_basket_league.cr"
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
      # if TicketSystem.has_constant? "TicketingReservation"
      # if TicketingReservation.has_method? "tickets_available"
      ticket_system = TicketSystem.new(200, "Bellebrook")
      ticket_system.tickets_available.should eq 200
      # else
      #   raise "TicketingReservation does not have a tickets_available method"
      # end
      # else
      #   raise "TicketingReservation does not exist"
      # end
    end

    it "Test 4" do
      # if @top_level.has_constant? "TicketingReservation"
      # if TicketingReservation.has_method? "tickets_available"
      ticket_system = TicketSystem.new(10, "Bellebrook")
      ticket_system.tickets_available.should eq 10
      # else
      #     raise "TicketingReservation does not have a tickets_available method"
      # end
      # else
      #   raise "TicketingReservation does not exist"
      # end
    end
  end

  context "Task 3" do
    it "Test 5" do
      # if @top_level.has_constant? "TicketingReservation"
      # if TicketingReservation.has_method?("order_ticket?") && TicketingReservation.has_method?("tickets_available")
      ticket_system = TicketSystem.new(200, "Bellebrook")
      ticket_system.tickets_available.should eq 200
      ticket_system.order_ticket?.should eq true
      ticket_system.tickets_available.should eq 199
      # else
      #   raise "TicketingReservation does not have a order_ticket? method"
      # end
      # else
      #   raise "TicketingReservation does not exist"
      # end
    end

    it "Test 6" do
      # if @top_level.has_constant? "TicketingReservation"
      # if TicketingReservation.has_method?("order_ticket?") && TicketingReservation.has_method?("tickets_available")
      ticket_system = TicketSystem.new(100, "Bellebrook")
      ticket_system.tickets_available.should eq 100
      ticket_system.order_ticket?.should eq true
      ticket_system.tickets_available.should eq 99
      # else
      #   raise "TicketingReservation does not have a order_ticket? method"
      # end
      # else
      #   raise "TicketingReservation does not exist"
      # end
    end

    it "Test 7" do
      # if @top_level.has_constant? "TicketingReservation"
      # if TicketingReservation.has_method?("order_ticket?") && TicketingReservation.has_method?("tickets_available")
      ticket_system = TicketSystem.new(99, "Bellebrook")
      ticket_system.tickets_available.should eq 99
      ticket_system.order_ticket?.should eq false
      ticket_system.tickets_available.should eq 99
      # else
      #   raise "TicketingReservation does not have a order_ticket? method"
      # end
      # else
      #   raise "TicketingReservation does not exist"
      # end
    end

    it "Test 8" do
      # if @top_level.has_constant? "TicketingReservation"
      # if TicketingReservation.has_method?("order_ticket?") && TicketingReservation.has_method?("tickets_available")
      ticket_system = TicketSystem.new(10, "Bellebrook")
      ticket_system.tickets_available.should eq 10
      ticket_system.order_ticket?.should eq false
      ticket_system.tickets_available.should eq 10
      # else
      #   raise "TicketingReservation does not have a order_ticket? method"
      # end
      # else
      #   raise "TicketingReservation does not exist"
      # end
    end

    it "Test 9" do
      # if @top_level.has_constant? "TicketingReservation"
      # if TicketingReservation.has_method?("order_ticket?") && TicketingReservation.has_method?("tickets_available")
      ticket_system = TicketSystem.new(0, "Bellebrook")
      ticket_system.tickets_available.should eq 0
      ticket_system.order_ticket?.should eq false
      ticket_system.tickets_available.should eq 0
      # else
      #   raise "TicketingReservation does not have a order_ticket? method"
      # end
      # else
      #   raise "TicketingReservation does not exist"
      # end
    end
  end

  context "Task 4" do
    it "Test 10" do
      # if @top_level.has_constant? "TicketingReservation"
      # if TicketingReservation.has_method?("tickets_available") && TicketingReservation.has_method?("order_message")
      expected = "John, your purchase was successful, your ticket number is #100, and the game is played at the Bellebrook stadium."

      ticket_system = TicketSystem.new(100, "Bellebrook")
      ticket_system.tickets_available.should eq 100
      ticket_system.order_message("John").should eq expected
      ticket_system.tickets_available.should eq 99
      # else
      #   raise "TicketingReservation does not have a order_message method"
      # end
      # else
      #   raise "TicketingReservation does not exist"
      # end
    end

    it "Test 11" do
      # if @top_level.has_constant? "TicketingReservation"
      # if TicketingReservation.has_method?("tickets_available") && TicketingReservation.has_method?("order_message")
      expected = "John, your purchase was unsuccessful, there are not enough tickets available."

      ticket_system = TicketSystem.new(10, "Bellebrook")
      ticket_system.tickets_available.should eq 10
      ticket_system.order_message("John").should eq expected
      ticket_system.tickets_available.should eq 10
      # else
      #   raise "TicketingReservation does not have a order_message method"
      # end
      # else
      #   raise "TicketingReservation does not exist"
      # end
    end

    it "Test 12" do
      # if @top_level.has_constant? "TicketingReservation"
      # if TicketingReservation.has_method?("tickets_available") && TicketingReservation.has_method?("order_message")
      expected = "Jane, your purchase was successful, your ticket number is #100, and the game is played at the Redwood stadium."

      ticket_system = TicketSystem.new(100, "Redwood")
      ticket_system.tickets_available.should eq 100
      ticket_system.order_message("Jane").should eq expected
      ticket_system.tickets_available.should eq 99
      # else
      #   raise "TicketingReservation does not have a order_message method"
      # end
      # else
      #   raise "TicketingReservation does not exist"
      # end
    end

    it "Test 13" do
      # if @top_level.has_constant? "TicketingReservation"
      # if TicketingReservation.has_method?("tickets_available") && TicketingReservation.has_method?("order_message")
      expected = "Jane, your purchase was unsuccessful, there are not enough tickets available."

      ticket_system = TicketSystem.new(5, "Redwood")
      ticket_system.tickets_available.should eq 5
      ticket_system.order_message("Jane").should eq expected
      ticket_system.tickets_available.should eq 5
      # else
      #   raise "TicketingReservation does not have a order_message method"
      # end
      # else
      #   raise "TicketingReservation does not exist"
      # end
    end
  end
end
