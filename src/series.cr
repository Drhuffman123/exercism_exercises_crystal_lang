module Series
  def self.subslice(series : String, slice_length : Number, offset : Int32 = 0)
    size = series.size
    results = Array(String).new
    if size >= slice_length && offset < size
      results << series[offset..offset+slice_length-1]
      if offset < size - slice_length
        offset += 1
        results += subslice(series, slice_length, offset)
      end
    end
    results.flatten
  end

  def self.slices(series : String, slice_length : Number) : Array(String)
    if slice_length <= 0 || slice_length > series.size
      raise ArgumentError.new
    end
    subslice(series, slice_length)
  end
end
