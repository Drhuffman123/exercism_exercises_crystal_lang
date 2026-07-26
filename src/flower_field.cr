require "yaml"

class FlowerField
  include YAML::Serializable

  property ff_arr : Array(String) # = ["   ", " * ", "   "]
  property tmp_sub_counts = Array(Int32).new
  property counts = Array(Array(Int32)).new

  def initialize(ff : Array(String))
    @ff_arr = ff
    init_counts
    calc_counts
  end
  
  def init_counts
    @ff_arr.each_with_index do |str, i| 
      @tmp_sub_counts << 0
    end
    @ff_arr.each_with_index do |str, i| 
      @counts << tmp_sub_counts
    end
  end
  
  def calc_counts
    @ff_arr.each_with_index do |str, i|
      str.chars.each_with_index do |chr, j|
        if chr == "*"
          @counts[i][j] = 1
        end
      end
    end
    @counts.each_with_index do |grp_cnts, i| 
      puts "_"*10
      grp_cnts.each_with_index do |cnt, j| 
        puts "i: #{i}, j: #{j}, cnt: #{cnt}"
      end
      puts "."*10
    end
  end

  def annotate
    # @ff_arr.each_with_index { |x, i| puts "#{i}: <#{x}>" }
    @counts
  end
  
  def debug
    puts "@ff_arr: #{@ff_arr}"
    
    puts "-"*100
    puts "\nFlowerField:\n#{self.to_yaml}\n"
    puts "-"*100
  end
  
  def debug2
    arr = @ff_arr # ["  *  ", "  *  ", "*****", "  *  ", "  *  "]
    puts arr.class

    tmp_sub_counts = Array(Int32).new
    counts = Array(Array(Int32)).new
      
    puts arr.size
    puts arr[0].size
    puts counts

    arr.each_with_index do |str, i| 
      tmp_sub_counts << 0
    end
    arr.each_with_index do |str, i| 
      counts << tmp_sub_counts
    end
    puts "tmp_sub_counts: <#{tmp_sub_counts}>"
    puts "counts: <#{counts}>"

    counts.each_with_index do |grp_cnts, i| 
      puts "_"*10
      grp_cnts.each_with_index do |cnt, j| 
        puts "i: #{i}, j: #{j}, cnt: #{cnt}"
      end
      puts "."*10
    end
      

    puts "arr: #{arr}, arr.size: #{arr.size}, so .. #{[0..arr.size-1]}"
    puts "counts: <#{counts}>"
  end
end