class Queen
  property row : Int32
  property col : Int32

  def initialize(row : Int32, col : Int32)
    @row = row
    @col = col
    if row < 0 || row > 7 || col < 0 || col > 7
      raise ArgumentError.new
    end
  end

  def check_diag_n_p(other, delta)
    if self.row - delta == other.row && self.col + delta == other.col
      true
    else
      false
    end
  end

  def check_diag_n_n(other, delta)
    if self.row - delta == other.row && self.col - delta == other.col
      true
    else
      false
    end
  end

  def check_diag_p_p(other, delta)
    if self.row + delta == other.row && self.col + delta == other.col
      true
    else
      false
    end
  end

  def check_diag_p_n(other, delta)
    if self.row + delta == other.row && self.col - delta == other.col
      true
    else
      false
    end
  end

  def check_dirs(other)
    found = false
    (0..7).map do |delta|
      found = found || check_diag_n_n(other, delta) ||
              check_diag_n_p(other, delta) ||
              check_diag_p_n(other, delta) ||
              check_diag_p_p(other, delta) ||
              self.row == other.row ||
              self.col == other.col
    end
    found
  end

  def can_attack?(other : Queen)
    check_dirs(other)
  end
end
