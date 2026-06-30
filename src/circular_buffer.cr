require "yaml"

class CircularBuffer
  include YAML::Serializable

  property pos_write : Int32, pos_read : Int32 # 0+
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
    # if @qty_reads[@pos_read-1] > 0
    #   raise RuntimeError.new("Error reading when already read this part: @pos_read: #{@pos_read}, @qty_reads: #{@qty_reads}, self: #{self.to_yaml}")
    # end
    if @pos_read - 1 > @qty_reads.size
      raise RuntimeError.new("Error pos out of bounds (too big): #{self.to_yaml}")
    end
    if @pos_read < 0
      raise RuntimeError.new("Error pos out of bounds (too small): #{self.to_yaml}")
    end
    if @qty_in_use == 0
      raise RuntimeError.new("Error reading when no data yet written.")
    end
    puts "\n @qty_reads: #{@qty_reads}; self: #{self.to_yaml}"
    # if @qty_reads[@pos_read-1] > 1
    #   raise RuntimeError.new("Error reading same pos more than once (before refillind).")
    # end
  end

  def check_overwrites!
    if @pos_write > @data.size
      raise RuntimeError.new("Oops, overfilled! data size currently maxes out at: #{@data.size}; self: #{self.to_yaml}")
    end
  end

  def write(x)
    # puts "\n write..:: x: #{x}, self: #{"-"*100+"\n"} #{self.to_yaml}"
    # @qty_in_use
    # raise "Oops: \n\n x: #{x}, @pos_write: #{@pos_write}, @data: #{@data}, \n" + self.to_yaml + "\n <:bad self"
    if @pos_write >= @data.size
      @pos_write -= @data.size
      # raise RuntimeError.new("Oops, write error (no wrapping)")
    end
    if @data[@pos_write] != nil
      raise RuntimeError.new("Oops, @pos_write: #{@pos_write}, self: #{self}, cant write to this pos yet; must clear the space first! self: #{self.to_yaml}")
    end
    check_overfill_spot!
    @data[@pos_write] = x
    @qty_in_use += 1
    @pos_write += 1
    if @pos_write > @data.size
      @pos_write = 0
    end
    puts "\n write..== x: #{x}, self: #{"="*100+"\n"} #{self.to_yaml}"
  end
  
  def read_OLD : Int32?
    check_reads!
    check_empty_data_when_read!
    # val_before_reading = @data[@pos_read-1]
    if @pos_read > @data.size || @pos_read < 0
      # raise RuntimeError.new("Oops, 
      raise RuntimeError.new("Oops, error reading from @pos_read: #{@pos_read}, @data.size: #{@data.size}, self: #{self.to_yaml}")
    end
    val_before_reading = @data[@pos_read]
    if val_before_reading == nil
      raise RuntimeError.new("Oops, error reading from empty data at @pos_read: #{@pos_read}, self: #{self.to_yaml}")
    end
    puts "read..:: val_before_reading: #{val_before_reading}, self: #{"-"*100+"\n"} #{self.to_yaml}"
    @data[@pos_read] = nil
    @qty_reads[@pos_read] += 1
    @qty_in_use -= 1
    @pos_read += 1
    @pos_write -= 1
    if @pos_write < 0
      @pos_write = (@data.size) -1
    end
    if @pos_write > @data.size
      @pos_write = 0
    end
    if @pos_read > @data.size
      @pos_read = 0
    end
    puts "read..== val_before_reading: #{val_before_reading}, self: #{"="*100+"\n"} #{self.to_yaml}"
    val_before_reading
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
    # puts "read..:: val_before_reading: #{val_before_reading}, self: #{"-"*100+"\n"} #{self.to_yaml}"
    @data[@pos_read] = nil
    @qty_reads[@pos_read] += 1
    @qty_in_use -= 1
    @pos_read += 1
    # @pos_write -= 1
    # if @pos_write < 0
    #   @pos_write = (@data.size) -1
    # end
    if @pos_read + 1 > @data.size
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
    # puts "\n overwrite..:: x: #{x}, self: #{"-"*100+"\n"} #{self.to_yaml}"
    # if @data[@pos_write] != nil && x != nil
    #   raise RuntimeError.new("Oops, cant write to this pos yet; must clear the space first! self: #{self.to_yaml}")
    # end
    # check_overfill_spot!
    @pos_write -= 1
    check_overwrites!
    @data[@pos_write] = x
    @qty_in_use += 1
    puts "\n overwrite..== x: #{x}, self: #{"-"*100+"\n"} #{self.to_yaml}"
  end
end

def debug
  buffer = CircularBuffer.new(1)
  puts buffer.to_yaml
  puts
  puts buffer.data.to_yaml
  puts buffer.qty_in_use
  puts buffer.read
end