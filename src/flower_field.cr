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
      str.chars.map_with_index do |char, i|
        if char == "*"
          @counts << [1]
          [1]
        else
          @counts << tmp_sub_counts
          [0]
        end
      end.join
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

  def count_nearby_stars_prev_row(str, i, chr, j) : Int32
    cnt = 0

    # next row:
    if i < (@ff_arr.size) - 1 && @ff_arr[i] > ""
      if j > 0 && @ff_arr[i + 1].chars[j - 1] == '*'
        cnt += 1
      end
      if @ff_arr[i + 1].chars[j] == '*'
        cnt += 1
      end
      if j < (@ff_arr[i + 1].size) - 2 && @ff_arr[i + 1].chars[j + 1] == '*'
        cnt += 1
      end
    end

    puts "PREV:: cnt: #{cnt}, @ff_arr: #{@ff_arr}, @ff_arr[i].size: #{@ff_arr[i].size}, str: #{str}, str.chars[j-1] == '*', i == #{i}, chr == '#{chr}', j == #{j}"

    cnt
  end

  def count_nearby_stars_same_row(str, i, chr, j) : Int32
    cnt = 0

    # str == @ff_arr[i]

    # same row:
    if j >= 0 && @ff_arr[i].chars[j - 1] == '*'
      cnt += 1
      # raise "oops, j >= 0 && @ff_arr: #{@ff_arr}, @ff_arr[i].size: #{@ff_arr[i].size}, str: #{str}, str.chars[j-1] == '*', i == #{i}, chr == '#{chr}', j == #{j}"
    end
    if @ff_arr[i].chars[j] == '*'
      cnt += 1
    end
    if j < (@ff_arr[i].size) - 2 && @ff_arr[i].chars[j + 1] == '*'
      cnt += 1
    end

    puts "SAME:: cnt: #{cnt}, @ff_arr: #{@ff_arr}, @ff_arr[i].size: #{@ff_arr[i].size}, str: #{str}, str.chars[j-1] == '*', i == #{i}, chr == '#{chr}', j == #{j}"

    cnt
  end

  def count_nearby_stars_next_row(str, i, chr, j) : Int32
    cnt = 0

    # prev row:
    if i > 0 && @ff_arr[i - 1] > ""
      if j > 0 && @ff_arr[i - 1].chars[j - 1] == '*'
        cnt += 1
      end
      if @ff_arr[i - 1].chars[j] == '*'
        cnt += 1
      end
      if j < (@ff_arr[i - 1].size) - 2 && @ff_arr[i - 1].chars[j + 1] == '*'
        cnt += 1
      end
    end

    puts "NEXT:: cnt: #{cnt}, @ff_arr: #{@ff_arr}, @ff_arr[i].size: #{@ff_arr[i].size}, str: #{str}, str.chars[j-1] == '*', i == #{i}, chr == '#{chr}', j == #{j}"

    # puts "count_nearby_stars_next_row(str,i,chr,j): str: #{str}, i: #{i}, chr: #{chr}, j: #{j},"

    cnt
  end

  def count_nearby_stars(str, i, chr, j)
    cnt = count_nearby_stars_prev_row(str, i, chr, j) + count_nearby_stars_same_row(str, i, chr, j) + count_nearby_stars_next_row(str, i, chr, j)

    if cnt == 0
      ' '
    else
      cnt
    end
  end

  def annotate
    # @ff_arr.each_with_index { |x, i| puts "#{i}: <#{x}>" }
    @ff_arr.map_with_index do |str, i|
      str.chars.map_with_index do |chr, j|
        if chr == '*'
          chr
          # count_nearby_stars(str,i,chr,j)
        else
          count_nearby_stars(str, i, chr, j)
        end
        # count_nearby_stars(str,i,chr,j)
      end.join
    end
    # .to_s + self.to_yaml
    # @counts.map do |arr|
    #   arr.map do |sub|
    #     if sub == 1
    #       '*'
    #     else
    #       ' '
    #     end
    #   end.join
    # end.to_s
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

    puts "arr: #{arr}, arr.size: #{arr.size}, so .. #{[0..arr.size - 1]}"
    puts "counts: <#{counts}>"
  end
end
