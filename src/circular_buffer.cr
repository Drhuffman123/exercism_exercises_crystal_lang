require "yaml"

class CircularBuffer
  include YAML::Serializable

  property pos_write : Int32, pos_read : Int32 # 0+
  property qty_in_use : Int32  # 0+
  property data : Array(Int32?) # 0+
  property qty_reads : Array(Int32) # 0+

  def initialize(data_size : Int32)
    @qty_in_use = 0
    @qty_reads = Array(Int32).new(data_size, 0)
    @data = Array(Int32?).new(data_size, nil)
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
    if @pos_read == 0
      raise RuntimeError.new("reading empty data not allowed; Must add items first!")
    end
  end

  def check_reads!
    if @qty_reads[@pos_read-1] > 0
      raise RuntimeError.new("Error reading when already read this part: @pos_read: #{@pos_read}, @qty_reads: #{@qty_reads}, self: #{self}")
    end
    if @pos_read - 1 > @qty_reads.size
      raise RuntimeError.new("Error pos out of bounds (too big): #{self.to_yaml}")
    end
    if @pos_read - 1 < 0
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
      raise RuntimeError.new("Oops, overfilled! data size currently maxes out at: #{@data.size}; self: #{@self.to_yaml}")
    end
  end

  def write(x)
    check_overfill_spot!
    @data[@pos_write-1] = x
    @qty_in_use += 1
    @pos_write += 1
    # if @pos > @data.size
      # @pos = 0 # TODO :Check why this is here!
    # end
  end
  
  def read : Int32?
    check_reads!
    check_empty_data_when_read!
    val_before_reading = @data[@pos_read-2]
    @data[@pos_read-2] = nil
    @qty_reads[@pos_read-2] += 1
    # @pos += 1
    val_before_reading
  end

  def clear
    @pos_write = 0
    @pos_read = 0  # TODO :Check why this is here!
    @qty_in_use = 0
    @data = Array(Int32?).new
    @qty_reads = Array(Int32).new(data_size, 0)
  end

  def overwrite(x : Int32?)
    @data[@pos_write-1] = x
    @qty_reads[@pos_write-1] += 1
    @qty_in_use += 1
    @pos_write += 1
    check_overwrites!
    # @pos = -1
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