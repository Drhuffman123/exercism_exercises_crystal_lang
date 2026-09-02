module BottleSong
  class NumberToWords
    @@ones = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
              "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen",
              "Seventeen", "Eighteen", "Nineteen"]
    @@tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    @@thousands = ["", "Thousand", "Million", "Billion", "Trillion"]

    def self.convert(num : Int32) : String
      return "Zero" if num == 0

      words = ""
      i = 0
      n = num

      while n > 0
        if n % 1000 != 0
          words = "#{convert_chunk(n % 1000)} #{@@thousands[i]} #{words}".strip
        end
        n //= 1000
        i += 1
      end

      words.strip
    end

    private def self.convert_chunk(n : Int32) : String
      if n == 0
        ""
      elsif n < 20
        @@ones[n] + " "
      elsif n < 100
        @@tens[n // 10] + " " + convert_chunk(n % 10)
      else
        @@ones[n // 100] + " Hundred " + convert_chunk(n % 100)
      end
    end
  end

  def self.verse_words(num) : Array(String)
    if num <= 1
      qty_word = "One"
      item = "bottle"
      become_qty_word = "No"
      become_item = "bottles"
    elsif num == 2
      qty_word = "Two"
      item = "bottles"
      become_qty_word = "One"
      become_item = "bottle"
    else
      qty_word = NumberToWords.convert(num).capitalize
      item = "bottles"
      become_qty_word = NumberToWords.convert(num-1).capitalize
      become_item = "bottles"
    end
    [qty_word, item, become_qty_word.downcase, become_item]
  end

  def self.verse_segment(num : Int32) : Array(String)
    words = verse_words(num)
    [
      "#{words[0]} green #{words[1]} hanging on the wall,",
      "#{words[0]} green #{words[1]} hanging on the wall,",
      "And if one green bottle should accidentally fall,",

      "There'll be #{words[2]} green #{words[3]} hanging on the wall."
    ]
  end

  def self.verse(num)
    # (num..1).each { |x| verse_segment(x) }.join.to_s
    verse_segment(num)
  end

  def self.recite(start_bottles : Int32, take_down = 0)
    song_verses = Array(String).new
    verse_count = 0
    start_bottles.downto(start_bottles-take_down+1) do |n|
      song_verses += verse(n) # + "\n"
      verse_count += 1
      if verse_count < take_down
        song_verses += [""]
      end
    end
    song_verses
  end
end
