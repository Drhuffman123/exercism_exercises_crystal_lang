require "json"

class BinarySearch
  include JSON::Serializable

  property arr : Array(Int32)
  property cur_index : Int32
  property prev_index : Int32
  property left_index : Int32
  property right_index : Int32
  property next_index : Int32
  property moves : Array(String) = ["Start"]
  property changes : Array(String) = ["Init"]

  def initialize(arr : Array(Int32))
    @arr = arr
    @cur_index = (@arr.size/2).to_i
    @prev_index = cur_index
    @next_index = cur_index
    @left_index = 0
    @right_index = @arr.size - 1
  end

  def debug_pos
    "@cur_index: #{@cur_index}, @prev_index: #{@prev_index}, @next_index: #{@next_index}, @left_index: #{@left_index}, @right_index: #{@right_index}"
  end

  def dig_deeper(value, steps = 0)
  end

  def find(value, steps = 0)
    moves << "BEGINNING(value: #{value}, steps: #{steps})"
    if steps > @arr.size
      raise "Opps, you stepped too far Right, looking in @arr: #{@arr} for value: #{value}, steps: #{steps}, @arr.size: #{@arr.size}, @changes: #{@changes}" # , self: #{self.to_json})
    elsif steps < 0
      raise "Opps, you stepped too far Left, looking in @arr: #{@arr} for value: #{value}, steps: #{steps}, @arr.size: #{@arr.size}, @changes: #{@changes}" # , self: #{self.to_json})
    else
      if value == @arr[@cur_index]
        # found it!
        @moves << "FOUND IT! (looking in @arr: #{@arr} for value: #{value}, from: #{@prev_index}, to: #{@cur_index}, @changes: #{@changes}," # , self: #{self.to_json})
        puts "Found it looking in @arr: #{@arr} for value: #{value}, @changes: #{@changes}, via: " # , self: #{self.to_json})
        @changes << "found #{value} at #{@cur_index} in #{steps}"
        [@cur_index, value]
      elsif value == @arr[0]
        # found it!
        @moves << "FOUND IT! (looking in @arr: #{@arr} for value: #{value}, from: #{@prev_index}, to: #{@cur_index}, @changes: #{@changes}," # , self: #{self.to_json})
        puts "Found it looking in @arr: #{@arr} for value: #{value}, @changes: #{@changes}, via: " # , self: #{self.to_json})
        @changes << "found #{value} at #{@cur_index} in #{steps}"
        [@cur_index, value]
        [0, value]
      elsif value == @arr[-1]
        # found it!
        @moves << "FOUND IT! (looking in @arr: #{@arr} for value: #{value}, from: #{@prev_index}, to: #{@cur_index}, @changes: #{@changes}," # , self: #{self.to_json})
        puts "Found it looking in @arr: #{@arr} for value: #{value}, @changes: #{@changes}, via: " # , self: #{self.to_json})
        @changes << "found #{value} at #{@cur_index} in #{steps}"
        [@cur_index, value]
        [@arr.size - 1, value]
      elsif @arr[0] <= value && value < @arr[@cur_index]
        # LEFT:

        @changes << "LEFT #{value} at #{@cur_index} in #{steps}, #{debug_pos}"

        if @cur_index == 0
          raise "Oops, can't go more left, steps: #{steps}"
        end
        # seek left more
        @prev_index = @cur_index
        @left_index = @cur_index
        # @right_index = @cur_index # stays the same for now
        @cur_index = ((@left_index + @right_index)/2).to_i
        @moves << "Left (looking in @arr: #{@arr} for value: #{value}, from: #{@prev_index}, to: #{@cur_index}, @changes: #{@changes}" # , self: #{self.to_json})
        find(value, steps + 1)
        # [@cur_index, value]
      elsif @arr[@cur_index] < value && value <= @arr[-1]
        # RIGHT:

        @changes << "RIGHT #{value} at #{@cur_index} in #{steps}, #{debug_pos}"

        if @cur_index == (@arr.size - 1)
          raise "Oops, can't go more right, steps: #{steps}"
        end
        @prev_index = @cur_index
        # seek right more
        # @left_index # stays the same for now
        @right_index = @cur_index
        @cur_index = ((@left_index + @right_index)/2).to_i
        @moves << "Right (looking in @arr: #{@arr} for value: #{value}, from: #{@prev_index}, to: #{@cur_index}, @changes: #{@changes}" # , self: #{self.to_json})
        find(value, steps + 1)
        # [@cur_index, value]
      end
    end
  end
end
