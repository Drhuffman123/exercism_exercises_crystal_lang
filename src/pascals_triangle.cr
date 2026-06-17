module PascalsTriangle
  @@cells = [[1]] # , [1,1]] #, [1,2,1]]
  @@loaded_upto = 0

  def self.rows(row_count : Int32)
    if @@loaded_upto < row_count - 1
      if @@cells.size < row_count - 1
        (@@cells.size - 1..row_count - 1).each { |x| seed(x.to_i) }
      end
      seed(row_count - 1)
    end
    if row_count == 0
      Array(Int32).new
    else
      @@cells
    end
  end

  def self.seed(row_count : Int32)
    if row_count < (@@cells.size)
      @@cells[row_count - 1]
    else
      result = Array(Int32).new
      starter = @@cells[-1]
      result += starter.map_with_index { |_, i|
        if i == 0
          1
        else
          starter[i - 1] + starter[i]
        end
      }
      result << 1
      @@cells << result
    end
  end

  def self.cells
    @@cells
  end
end
