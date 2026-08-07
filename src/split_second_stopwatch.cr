require "time"
require "yaml"

class SplitSecondStopwatch
  include YAML::Serializable

  FORMATTER = Time::Format.new("%H:%M:%S")
  STATES    = ["ready", "running", "stopped"]

  property state = STATES[0]
  property time_is = Time::Span.new(hours: 0, minutes: 0, seconds: 0)
  property laps : Array(Time::Span) # = ["00:00:00"]
  property lap_index = 0

  def initialize
    @state = STATES[0]
    @time_is = Time::Span.new(hours: 0, minutes: 0, seconds: 0)
    @laps = Array(Time::Span).new
  end

  def current_lap
    # @laps[@lap_index].to_s
    @laps[0].to_s
  end

  def append_lap
    @laps << @time_is
    result = @laps[@lap_index]
    @lap_index += 1
    result
  end

  def total
    @time_is.to_s # ToReview
  end

  def lap
    if @state == "running"
      append_lap
    else
      Array(Time::Span).new
    end
  end

  def previous_laps
    if @laps.size > 0
      @laps[0..@lap_index - 1]
    else
      Array(Time::Span).new
    end
  end

  def start
    if @state == "ready"
      @state = "running"
    elsif @state == "stopped"
      @state = "running"
    else
      raise ArgumentError.new("Oops, already started")
    end
  end

  def stop
    if @state != "running"
      raise ArgumentError.new("Oops, already stopped")
    else
      @state = "stopped"
      # @time_is = "00:00:00"
      @laps << set_time(@time_is.to_s)
      @lap_index = (@laps.size) - 1
    end
  end

  def set_time(time : String)
    if @state == "running"
      # @time_is += FORMATTER.parse(time) # .to_s("%H:%M:%S")) # .to_s("%H:%M:%S")+
      parsed_time = Time.parse(time, "%H:%M:%S", Time::Location::UTC)
      hrs = parsed_time.hour
      mins = parsed_time.minute
      secs = parsed_time.second
      @time_is = Time::Span.new(hours: hrs, minutes: mins, seconds: secs)
    else
      @time_is = Time::Span.new
    end
  end

  def advance_time(time : String)
    if @state == "running"
      # @time_is += FORMATTER.parse(time) # .to_s("%H:%M:%S")) # .to_s("%H:%M:%S")+
      parsed_time = Time.parse(time, "%H:%M:%S", Time::Location::UTC)
      hrs = parsed_time.hour
      mins = parsed_time.minute
      secs = parsed_time.second
      @time_is += Time::Span.new(hours: hrs, minutes: mins, seconds: secs)
    else
      @time_is = Time::Span.new
    end
  end
end
