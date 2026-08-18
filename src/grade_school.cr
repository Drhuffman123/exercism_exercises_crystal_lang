class GradeSchool
  property roster = Array(Array(String)).new

  def initialize
  end

  def roster
    @roster
  end

  def add(name, grade)
    if @roster.size == 0
      # @roster += Array(String).new
    end
    if @roster[0].size == 0
      @roster[0] += Array(String).new
    end
    @roster[grade] << name unless @roster[grade].includes?(name)
  end
end