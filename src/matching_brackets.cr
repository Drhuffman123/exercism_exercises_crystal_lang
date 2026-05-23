class SubGroups
  HASH_MATCH_TYPES = {'{' => '}', '[' => ']', '(' => ')'}
  property group_found = {:started => false, :closed => false, :contains => nil}
  property groups_found = Array(Hash(Char, Int32)).new

  # Hash(Char, found: Bool).new

  def all_closed? : Bool
    groups_found[:closed] && groups_found[:contains].all_closed?
  end

  def open_group(group_starter_char : Char) : SubGroups
    if group_starter_char == '{'
      SubGroups.new.groups_found << {
        :starts_with => '{',
        :ends_with   => '}',
        :closed      => false,
        :contains    => nil,
      }
    elsif group_starter_char == '['
      SubGroups.new.groups_found << {
        :starts_with => '[',
        :ends_with   => ']',
        :closed      => false,
        :contains    => nil,
      }
    elsif group_starter_char == '('
      SubGroups.new.groups_found << {
        :starts_with => '(',
        :ends_with   => ')',
        :closed      => false,
        :contains    => nil,
      }
    else
      raise "Invalid start group char: '#{group_starter_char}'"
    end
  end

  def close_current_group_curly_brackets(next_char : Char) : SubGroups
    if next_char == '}' && groups_found[:starts_with] == '{' && groups_found[:closed] == false
      groups_found[:closed] = true
      groups_found
    end
  end

  def close_current_group_square_brackets(next_char : Char) : SubGroups
    if next_char == ']' && groups_found[:starts_with] == '[' && groups_found[:closed] == false
      groups_found[:closed] = true
      groups_found
    end
  end

  def close_current_group_parrenthasis(next_char : Char) : SubGroups
    if next_char == ')' && groups_found[:starts_with] == '(' && groups_found[:closed] == false
      groups_found[:closed] = true
      groups_found
    end
  end

  def open_sub(next_char : Char) : SubGroups
    if next_char == '{' || next_char == '[' || next_char == '('
      groups_found[:contains] = open_group(next_char)
      groups_found
    end
  end

  def close_current_group(next_char : Char) : SubGroups
    close_current_group_curly_brackets(next_char) ||
      close_current_group_square_brackets(next_char) ||
      close_current_group_parrenthasis(next_char) ||
      open_sub(next_char) ||
      raise "Invalid end group char: '#{next_char}'"
  end

  # def process_next_char(cur_hashes : SubGroups, char : Char) : SubGroups
  def process_next_char(char : Char) : SubGroups
    # groups_found
    # cur_hashes.
    groups_found[:contains] << if char == '{' || char == '[' || char == '('
      new_group(char)
    elsif char == '}' || char == ']' || char == ')'
      close_current_group(char)
    end
  end
end

module MatchingBrackets
  def self.valid?(str : String) : Bool
    cleaner_str = str.gsub(/[^\{\}\[\]\(\)]/, "")
    # hash = Hash
    # 1:
    # sum_diff = 0
    # strand1.chars.map_with_index { |char1, index|
    #   char2 = strand2[index]
    #   sum_diff += (VALID_CHARS[char1] - VALID_CHARS[char2]).abs
    # }
    # sum_diff

    # 2:
    # is_valid = true
    new_hash = SubGroups.new # Hash(String, Int32).new
    cleaner_str.each_char do |char|
      #   new_val = key.to_i
      #   value.each do |old_val|
      #     new_key = old_val.downcase
      #     # puts ">> key: #{key}, value: #{value} .. new_key: #{new_key}, new_val: #{new_val}"
      #     new_hash[new_key] = new_val
      # new_hash.process_next_char(new_hash, char)
      new_hash.process_next_char(char)
      #   end
    end
    # is_valid
    new_hash.all_closed?
  end
end
