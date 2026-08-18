module Meetup
  def self.wip
    if Time.utc(year, month, 1).day_of_week.value == 1 # day_of_week # Mon
      1
    elsif Time.utc(year, month, 1).day_of_week.value == 2 # day_of_week # Tue
      2
    elsif Time.utc(year, month, 1).day_of_week.value == 3 #  == day_of_week # Wed
      day_num = 3
    elsif Time.utc(year, month, 1).day_of_week.value == 3 #  == day_of_week # Thur
      day_num = 4
    elsif Time.utc(year, month, 1).day_of_week.value == 5 #  == day_of_week # Fri
      day_num = 5
    elsif Time.utc(year, month, 1).day_of_week.value == 6 #  == day_of_week # Sat
      day_num = 6
    else # Sun
      day_num = 7
    end
    [year,month,day_num]
  end

  def self.nth_week(year, month, week_num_offset, day_num_offset)
    Time.utc(year, month, 1 + day_num_offset)+ 7*week_num_offset
  end

  def self.first_day_of_month_is(year : Number, month : Number, day_num_offset = 0) # : Array(Int32)
    # Time.utc(year, month, 1 + day_num_offset).day_of_week.value
    date = Time.local(year, month, 1)
    # .value gives 1 for Monday, 2 for Tuesday, ..., 7 for Sunday
    days_to_add = (8 - date.day_of_week.value) % 7
    date.at_beginning_of_month + days_to_add.days
  end

  # def self.first_day_of_month_is_day_of_week(year : Number, month : Number, day_num_offset = 0) # : Array(Int32)
  #   Time.utc(year, month, 1 + day_num_offset).day_of_week 
  # end

  def self.meetup(year : Number, month : Number, week : String, day_of_week : String) : String
    date = if week == "first"
      first_day_of_month_is(year, month)
    elsif week == "second"
      first_day_of_month_is(year, month)+7.days
    elsif week == "third"
      first_day_of_month_is(year, month)+14.days
    elsif week == "fourth"
      first_day_of_month_is(year, month)+21.days
    elsif week == "teenth"
      first_of_week = first_day_of_month_is(year, month)
      # d = Time.utc(2026, 8, 5)
      first_of_month = Time.utc(year, month, first_of_week.day)
      first_of_month+12.days
    elsif week == "last"
      first_day_of_month_is(year, month)+28.days
    else
      first_day_of_month_is(year, month)
    end
    # "#{year}-#{month.to_s.rjust(2, '0')}-#{day_num.to_s.rjust(2, '0')}"
    # "#{ymd[0]}-#{ymd[1].to_s.rjust(2, '0')}-#{ymd[3].to_s.rjust(2, '0')}"
    # "#{year}-#{month.to_s.rjust(2, '0')}-#{day.to_s.rjust(2, '0')}"
    "#{date.year}-#{date.month.to_s.rjust(2,'0')}-#{date.day.to_s.rjust(2,'0')}"
  end
end
