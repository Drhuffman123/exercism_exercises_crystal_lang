module ArmstrongNumbers
  def self.armstrong_number?(input : Number) : Bool
    factor = input.to_s.size
    digits = input.to_s
    # puts "# '#{input}': to_s: #{input.to_s}, to_i: #{input.to_i}.. size: #{input.to_s.size}. factor: #{factor}"
    # puts input.to_s.each_char { |char| puts char }
    # count_chars = "#{input}".size
    sum_chars = 0
    input.to_s.each_char.with_index do |char, i|
      next_sum = (char.to_i*1) ^ (1*factor)
      # puts "# #{i}: #{char}, char.to_i: #{char.to_i}, factor.to_i: #{factor.to_i}, char.to_i ^ factor: #{char.to_i ^ factor}"
      # puts "# char.to_i: #{char.to_i}, factor: #{factor}, char.to_i ^ factor: #{(char.to_i*1) ^ (1*factor)}; next_sum: #{next_sum}"
      sum_chars += next_sum
    end
    # puts "#  .. "
    sum_chars == input
  end
end

# puts "9: #{ArmstrongNumbers.armstrong_number?(9)}"
# puts "10: #{ArmstrongNumbers.armstrong_number?(10)}"
# puts "153: #{ArmstrongNumbers.armstrong_number?(153)}"

puts "1^3 != 2, 1^3 == 1, but Crystal says: 2 WHY!!! #{1 ^ 3}"
puts "5^3 != 6, 5^3 == 125, but Crystal says: 6 WHY!!! #{5 ^ 3}"
puts "3^3 != 0, 3^3 == 27, but Crystal says: 0 WHY!!! #{3 ^ 3}"
puts "(1^3)+(5^3)+(3^3) == , but Crystal says: 8 WHY!!! #{(1 ^ 3) + (5 ^ 3) + (3 ^ 3)}"
