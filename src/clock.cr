class Clock
  property hour : Int32
  property minute : Int32

  def initialize(hour = 0, minute = 0)
    @hour = hour
    @minute = minute
    realign
    self
  end

  def realign
    realign_minutes
    realign_hour
  end

  def realign_minutes
    if @minute < 0
      @minute += 60
      @hour -= 1
      realign_minutes
    elsif @minute >= 60
      @minute -= 60
      @hour += 1
      realign_minutes
    else
      true
    end
  end

  def realign_hour
    if @hour < 0
      @hour += 24
      realign_hour
    elsif @hour >= 24
      @hour -= 24
      realign_hour
    else
      true
    end
  end

  def +(other : Clock) # hour=0, minute=0
    @hour += other.hour
    @minute += other.minute
    realign
    self
  end

  def -(other : Clock) # hour=0, minute=0
    @hour -= other.hour
    @minute -= other.minute
    realign
    self
  end

  def to_s
    "#{@hour.to_s.rjust(2, '0')}:#{@minute.to_s.rjust(2, '0')}"
  end

  def ==(other : Clock)
    self.realign
    other.realign
    if other.hour == @hour && other.minute == @minute
      true
    else
      false
    end
  end
end
