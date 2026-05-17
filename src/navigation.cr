class Navigation
  NEPTUNE_DISTANCE    = 4_400_000_000.to_i64 # Int64
  MARS_DISTANCE       = 227_940_000.to_i32   # Int32
  ATMOSPHERE_DISTANCE = 10000.to_i16         # Int16

  def correct_area_analysis(measurement)
    if measurement == 9999
      UInt32.new(measurement)
    elsif measurement.abs <= Int16::MAX
      UInt32.new(measurement)
    elsif measurement.abs <= UInt32::MAX
      UInt32.new(measurement)
    elsif measurement.abs <= Int32::MAX
      Int32.new(measurement)
    elsif measurement.abs <= UInt64::MAX
      UInt64.new(measurement)
    else
      Int64.new(measurement)
    end
  end

  def correct_float_class(msrmt)
    if msrmt < Float32::MAX
      Float32.new(msrmt)
    else
      Float64.new(msrmt)
    end
  end

  def calculate_velocity(distance, time)
    correct_float_class(distance/time)
  end
end
