module RunLengthEncoding
  class Rle
    @@arr_hash = Array(Hash(String, Int32)).new

    def initialize
      @@arr_hash = Array(Hash(String, Int32)).new
    end

    def self.reset
      new
    end

    def self.ah
      @@arr_hash
    end

    def self.to_s
      str = ""
      @@arr_hash.map do |hash|
        hash.each do |key, value|
          if value == 1
            str += "#{key}"
          else
            str += "#{value}#{key}"
          end
        end
      end
      str
    end

    def self.add(str : String)
      if @@arr_hash.size == 0
        new_hash = Hash(String, Int32).new { |hash, key| hash[key] = 0 }
        new_hash[str] = 1
        @@arr_hash << new_hash
      else
        if @@arr_hash[-1].keys[-1] == str
          # append
          existing_hash = @@arr_hash[-1]
          existing_hash[str] += 1
          @@arr_hash[-1] = existing_hash
        else
          # add new
          new_hash = Hash(String, Int32).new { |hash, key| hash[key] = 0 }
          new_hash[str] = 1
          @@arr_hash << new_hash
        end
      end
    end
  end

  def self.encode(input : String) : String
    Rle.reset
    input.each_char do |char|
      Rle.add(char.to_s).to_s
    end
    Rle.to_s
  end

  def self.decode(input : String) : String
    count = 0
    prev_chars = ""
    input.each_char do |char|
      if char == ""
        prev_chars += char.to_s
      elsif char.to_i?
        # add digit
        count = 10*count
        count += char.to_i
      else
        if count == 0
          count = 1
          prev_chars += char.to_s*count
          count = 0
        else
          prev_chars += char.to_s*count
          count = 0
        end
      end
    end
    prev_chars
  end
end

RunLengthEncoding.encode("AAACCBB")
RunLengthEncoding.decode("A4C5B")
RunLengthEncoding.decode("2A4C5B")
