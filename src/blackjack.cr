module Blackjack
  def self.parse_card(card)
    if card == "ace"
      11
    elsif card == "two"
      2
    elsif card == "three"
      3
    elsif card == "four"
      4
    elsif card == "five"
      5
    elsif card == "six"
      6
    elsif card == "seven"
      7
    elsif card == "eight"
      8
    elsif card == "nine"
      9
    elsif ["ten", "jack", "queen", "king"].includes?(card)
      10
    else
      0
    end  
  end

  def self.card_range(card1, card2)
    score = parse_card(card1) + parse_card(card2)
    if (4..11).includes?(score)
      "low"
    elsif (12..16).includes?(score)
      "mid"
    elsif (17..20).includes?(score)
      "high"
    else
      "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    # Stand (S)
    # Hit (H)
    # Split (P)
    # Automatically win (W)

    # If you have a pair of aces you must always split them.
    if card1 == "ace" && card2 == "ace"
      "P"
    # If you have a Blackjack (two cards that sum up to a value of 21),
    #   and the dealer does not have an ace, a figure or a ten 
    #   then you automatically win.
    elsif (parse_card(card1) + parse_card(card2)) == 21 && !["ace", "ten", "jack", "queen", "king"].includes?(dealer_card)
      "W"
    # If the dealer does have any of those cards then you'll have to stand and wait for the reveal of the other card.
    elsif ["ace", "ten", "jack", "queen", "king"].includes?(dealer_card)
      "S" # "H"
    # If your cards sum up to a value within the range [17, 20] you should always stand.
    elsif [17, 20].includes?(parse_card(card1) + parse_card(card2))
      "S2"
    # If your cards sum up to a value within the range [12, 16] you should always stand 
    #   unless the dealer has a 7 or higher, in which case you should always hit.
    elsif [12, 16].includes?(parse_card(card1) + parse_card(card2))
      if parse_card(dealer_card) > 7 #!["6", "5", "4", "3", "2"].includes?(dealer_card)
        "H1"
      else
        "S"
      end
    # If your cards sum up to 11 or lower you should always hit.
    elsif (2..11).includes?(parse_card(card1) + parse_card(card2))
      "H"
    end
  end
end
