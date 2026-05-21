class Navigation
  NEPTUNE_DISTANCE    = 4_400_000_000.to_i64 # Int64
  MARS_DISTANCE       = 227_940_000.to_i32   # Int32
  ATMOSPHERE_DISTANCE = 10000.to_i16         # Int16

  def correct_area_analysis(measurement)
    if measurement.abs <= UInt32::MAX
      measurement.to_u32
    elsif measurement.abs <= Int64::MAX
      measurement.to_i64
    elsif measurement.abs <= UInt64::MAX
      measurement.to_u64
    end
  end

  def correct_float_class(msrmt)
    if msrmt < Float32::MAX
      msrmt.to_f32
    else
      msrmt.to_f64
    end
  end

  def calculate_velocity(distance, time)
    correct_float_class(distance/time)
  end
end
