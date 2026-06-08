module IsbnVerifier
  def self.valid?(isbn : String) : Bool
    isbn_cleaned = isbn.gsub('-', "")
    if isbn_cleaned.size > 10
      raise "Bad ISBN, too many chars"
    end
    isbn9 = if isbn_cleaned[9] == 'X' || isbn_cleaned[9].ascii_number?
              if isbn_cleaned[9] == 'X'
                "10"
              else
                isbn_cleaned[9]
              end
            else
              raise "Bad ISBN, isbn_cleaned[9]: #{isbn_cleaned[9]}"
            end
    (isbn_cleaned[0].to_i * 10 + isbn_cleaned[1].to_i * 9 +
      isbn_cleaned[2].to_i * 8 + isbn_cleaned[3].to_i * 7 +
      isbn_cleaned[4].to_i * 6 + isbn_cleaned[5].to_i * 5 +
      isbn_cleaned[6].to_i * 4 + isbn_cleaned[7].to_i * 3 +
      isbn_cleaned[8].to_i * 2 + isbn9.to_i) % 11 == 0
  rescue
    false
  end
end
