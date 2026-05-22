module ETL
  def self.transform(input : Hash(String, Array(String))) : Hash(String, Int32)
    new_hash = Hash(String, Int32).new

    input.each do |key, value|
      new_val = key.to_i
      value.each do |old_val|
        new_key = old_val.downcase
        # puts ">> key: #{key}, value: #{value} .. new_key: #{new_key}, new_val: #{new_val}"
        new_hash[new_key] = new_val
      end
    end

    new_hash
  end
end
