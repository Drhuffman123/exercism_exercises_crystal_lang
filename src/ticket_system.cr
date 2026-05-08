#  aka BellebrookBasketLeague

module TicketingReservation
  def tickets_available
  end

  def order_ticket?
  end

  def order_message(name) : String
  end
end

class TicketSystem
  extend TicketingReservation

  def initialize(tickets_available : Int32, stadium : String = "tbd")
    @stadium = stadium
    @tickets_available = tickets_available
  end

  def tickets_available
    @tickets_available
  end

  def order_ticket?
    if @tickets_available >= 100
      @tickets_available -= 1
      true
    else
      false
    end
  end

  def order_message(name : String)
    order_number = @tickets_available
    if order_ticket?
      "#{name}, your purchase was successful, your ticket number is ##{order_number}," +
        " and the game is played at the #{@stadium} stadium."
    else
      "#{name}, your purchase was unsuccessful, there are not enough tickets available."
    end
  end
end
