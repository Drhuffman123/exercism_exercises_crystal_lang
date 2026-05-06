class JuiceMaker
  @@debug_light_on = true
  @fluid : Int32 = 0
  @running : Bool

  def self.debug_light_on?
    @@debug_light_on
  end

  def initialize(cups_of_juice)
    @fluid = cups_of_juice
    @running = false
  end

  def fluid
    @fluid
  end

  def start
    @running = true
  end

  def running?
    @running
  end

  def running
    @running
  end

  def add_fluid(amt)
    @fluid += amt
  end

  def stop(mins_to_stop)
    @fluid -= (mins_to_stop * 5)
    @running = false
  end
end
