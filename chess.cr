class Chess
  # the 'RANKS' constant
  RANKS = Range.new(1,8)
  # the 'FILES' constant
  FILES = Range.new('A','H')

  def self.valid_square?(rank, file) : Bool
    RANKS.includes?(rank) && FILES.includes?(file)
  end

  def self.nickname(first_name, last_name) : String
    (first_name[0..1] + last_name[-2..-1]).upcase
  end

  def self.move_message(first_name : String, last_name : String, square : String) # : String
    nn = nickname(first_name,last_name)
    square
    square.class == String
    square.size == 2
    # s0 = square[0]
    # s1 = square[1]
    # sq_valid = valid_square?(s0, s1)
    # if sq_valid
    #   "#{nn} moved to #{square}"
    # else
    #   "#{nn} attempted to move to #{square}, but that is not a valid square"
    # end
    # "TBD"
  end
end
