module SpellboundSteel
  def self.find_card?(cards, card)
    # raise "Please implement the SpellboundSteel.find_card? method"
    found = nil
    cards.map_with_index(0) do |element, index|
      puts "Element: #{element}, Index: #{index}"
      if !found && element == card
        found = index
      else
        nil
      end
    end
    found
  end

  def self.capitalize_names(characters)
    # raise "Please implement the SpellboundSteel.capitalize_names method"
  end

  def self.calculate_power_level(cards)
    # raise "Please implement the SpellboundSteel.calculate_power_level method"
  end

  def self.decode_characters(character)
    # raise "Please implement the SpellboundSteel.decode_characters method"
  end
end
