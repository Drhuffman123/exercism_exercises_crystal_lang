require "yaml"

class CircularBuffer
  include YAML::Serializable

  property pos_write : Int32
  property pos_read : Int32 # 0+
  property qty_in_use : Int32  # 0+
  property data : Array(Int32?) # 0+
  property qty_reads : Array(Int32) # 0+
  property data_size : Int32

  def initialize(data_size : Int32)
    @data_size = data_size
    @qty_in_use = 0
    @qty_reads = Array(Int32).new(@data_size, 0)
    @data = Array(Int32?).new(@data_size, nil)
    @pos_write = 0
    @pos_read = 0
  end

  def check_overfill_spot!
    if @qty_in_use == @data.size
      raise RuntimeError.new("Error trying to overfill data")
    end
  end

  def check_empty_data_when_read!
    if @data.size < 1
      raise RuntimeError.new("reading empty data buffer not allowed; @data: #{@data}")
    end
    if @pos_read < 0
      raise RuntimeError.new("reading empty data not allowed; Must add items first!")
    end
  end

  def check_reads!
    # todo
  end

  def check_overwrites!
    if @pos_write > @data.size
      raise RuntimeError.new("Oops, overfilled! data size currently maxes out at: #{@data.size}; self: #{self.to_yaml}")
    end
  end

  def write!(x)
    #check_overfill_spot!
    puts "\n !! x: #{x}, @pos_write: #{@pos_write}; @data: #{@data}; self: #{self.to_yaml}"
    if @pos_write >= @data.size
      @pos_write -= @data.size
    end
    @data[@pos_write] = x
    @qty_in_use += 1
    @pos_write += 1
    if @pos_write > @data.size
      @pos_write = 0
    end
    puts "\n write..== x: #{x}, self: #{"="*100+"\n"} #{self.to_yaml}"
  end

  def write(x)
    check_overfill_spot!
    write!(x)
  end

  def read : Int32?

    if @pos_read > @data.size || @pos_read < 0
      # raise RuntimeError.new("Oops, 
      raise RuntimeError.new("Oops, error reading from @pos_read: #{@pos_read}, @data.size: #{@data.size}, self: #{self.to_yaml}")
    end
    val_before_reading = @data[@pos_read]
    if val_before_reading == nil
      raise RuntimeError.new("Oops, error reading from empty data at @pos_read: #{@pos_read}, self: #{self.to_yaml}")
    end

    @data[@pos_read] = nil
    @qty_reads[@pos_read] += 1
    @qty_in_use -= 1
    @pos_read += 1

    # wrap around:
    if (@pos_read + 1) > @data.size
      @pos_read = 0
    end

    puts "read..== val_before_reading: #{val_before_reading}, self: #{"="*100+"\n"} #{self.to_yaml}"
    val_before_reading
  end

  def clear
    @data_size = data_size
    @qty_in_use = 0
    @qty_reads = Array(Int32).new(@data_size, 0)
    @data = Array(Int32?).new(@data_size, nil)
    @pos_write = 0
    @pos_read = 0
  end
  
  def overwrite(x : Int32?)
    # @pos_write += 1
    write!(x)
    @pos_read += 1
  end
end