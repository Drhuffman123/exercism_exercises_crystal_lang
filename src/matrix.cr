require "yaml"

class Matrix
  include YAML::Serializable

  property str : String
  property elem = 0
  property rows = Array(Array(Int32)).new
  property cols = Array(Array(Int32)).new

  def initialize(str)
    @str = str
    @rows = str.split("\n").map { |match1|
      match1.scan(/\d+/).map { |match2|
        match2[0].to_i
      }
    }

    @rows.map_with_index do |row, _|
      sub_cols = Array(Int32).new
      row.map_with_index do |cell, _|
        sub_cols << cell
      end
      @cols << sub_cols
    end
  end

  def row(index) # : Array(Int32)
    @rows[index - 1]
  end

  def column(index) # : Array(Int32)
    @cols[index - 1]
  end
end
