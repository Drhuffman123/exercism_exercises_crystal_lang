module SpellboundSteel
  def self.find_card?(cards, card)
    found = nil
    cards.map_with_index(0) do |element, index|
      if !found && element == card
        found = index
      else
        nil
      end
    end
    found
  end

  def self.capitalize_names(characters)
    characters.map do |str|
      str.split(" ").map do |segment|
        segment.capitalize
      end.join(" ").strip
    end
  end

  def self.calculate_power_level(cards)
    score = 0
    cards.each do |card|
      if find_card?([card], "Warrior")
        score += 10
      elsif find_card?([card], "Mage")
        score += 20
      elsif find_card?([card], "Rogue")
        score += 30
      elsif find_card?([card], "Fireball")
        score += 15
      elsif find_card?([card], "Ice Storm")
        score += 25
      elsif find_card?([card], "Lightning Bolt")
        score += 35
      end
    end
    score
  end

  def self.decode_characters(character)
    i = 0
    real_char = ""
    character.each_char do |char|
      if i.even?
        real_char += char
      end
      i += 1
    end
    real_char
  end
end
