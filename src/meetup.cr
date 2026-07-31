module Meetup
  def self.meetup(year : Number, month : Number, week : String, day_of_week : String) : String
    day_num = 13
    if Time.utc(year, month, 1).day_of_week.to_s == day_of_week # Time::DayOfWeek::Monday
    else
    end
    "#{year}-#{month.to_s.rjust(2, '0')}-#{day_num.to_s.rjust(2, '0')}"
  end
end
