class Navigation
  # TODO: define the 'NEPTUNE_DISTANCE' constant
  NEPTUNE_DISTANCE = 4_400_000_000.to_i64 # Int64

  # TODO: define the 'MARS_DISTANCE' constant
  MARS_DISTANCE = 227_940_000.to_i32 # Int32

  # TODO: define the 'ATMOSPHERE_DISTANCE' constant
  ATMOSPHERE_DISTANCE = 10000.to_i16 # Int16

  def correct_area_analysis(measurement)
    # raise "NEPTUNE_DISTANCE: #{NEPTUNE_DISTANCE.class}; MARS_DISTANCE: #{MARS_DISTANCE.class}; ATMOSPHERE_DISTANCE: #{ATMOSPHERE_DISTANCE.class}"
    # raise "Please implement the Navigation#correct_area_analysis method"

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
    # raise "Please implement the Navigation#calculate_velocity method"

    correct_float_class(distance/time)
  end
end
