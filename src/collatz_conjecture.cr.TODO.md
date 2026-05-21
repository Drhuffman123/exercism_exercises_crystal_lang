module CollatzConjecture
  def self.steps(input : Number) : Number
    # This won't work! I just get the specs getting stuck: "Error: instantiating '(Int32 | Number)#should(Spec::EqualExpectation(Int32))'"
    if input == 1
      # If it's 1 STOP!
      0
    elsif input.even?
      # If it's even, divide it by 2.
      input = (input / 2).to_i
      input = steps(input)
    else
      # If it's odd, multiply it by 3 and add 1.
      input = (input*3 + 1).to_i
      input = steps(input)
    end
  end
end
