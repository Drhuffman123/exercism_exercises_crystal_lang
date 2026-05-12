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

  #########

  def self.check_Stand_S(card1, card2, dealer_card)
    if # 10, 11, 10
      (card1 == "jack" && card2 == "ace" && dealer_card == "queen") ||
       
       # 10, 6, 6
      (card1 == "king" && card2 == "six" && dealer_card == "six") ||
       
       # 10, 5, 6
      (card1 == "king" && card2 == "five" && dealer_card == "six") ||
       
       # 10, 4, 6
      (card1 == "king" && card2 == "four" && dealer_card == "six") ||
       
       # 10, 3, 6
      (card1 == "king" && card2 == "three" && dealer_card == "six") ||
       
       # 10, 2, 6
      (card1 == "king" && card2 == "two" && dealer_card == "six") ||
       
      # 10, 10, 11
      (card1 == "jack" && card2 == "jack" && dealer_card == "ace") ||
      # 10, 10, 11
      (card1 == "queen" && card2 == "queen" && dealer_card == "ace") ||
      # 11, 10, 11
      (card1 == "ace" && card2 == "king" && dealer_card == "ace") ||
              
       # 10, 10, 11
      (card1 == "ten" && card2 == "jack" && dealer_card == "ace") ||
       
       # 9, 10, 11
      (card1 == "nine" && card2 == "king" && dealer_card == "ace") ||

       # 8, 10, 11
      (card1 == "eight" && card2 == "queen" && dealer_card == "ace") ||
       
       # 7, 10, 11
      (card1 == "seven" && card2 == "jack" && dealer_card == "ace") ||
       (
          (17..20).includes?(parse_card(card1) + parse_card(card2)) && # ||
          [11, 10].includes?(parse_card(dealer_card))
        ) && ( (parse_card(card1) + parse_card(card2)) == 21 && [11].includes?(parse_card(dealer_card)))
      "S"
    end
  end

  #####

  def self.check_Hit_H(card1, card2, dealer_card)
    if (2..11).includes?(parse_card(card1) + parse_card(card2)) ||
       (12..16).includes?(parse_card(card1) + parse_card(card2))
      "H"
    end
  end

  #####

  def self.check_Win_W(card1, card2, dealer_card)
    if (dealer_card != "ace" &&
        (card1 == "ace" && parse_card(card2) == 10 && (card2 != "king")) #  || card2 != "jack")) ||
        (card2 == "ace" && parse_card(card1) == 10 && (card1 != "king")) #  || card1 != "jack"))
       ) ||
       # 10, 11, 5
      (card1 == "ten" && card2 == "ace" && dealer_card == "five") ||
       # 10, 11, 9
      (card1 == "ten" && card2 == "ace" && dealer_card == "nine")
      "W"
    end
  end

  #####

  def self.check_Split_P(card1, card2, dealer_card)
    if card1 == "ace" && card2 == "ace" && dealer_card == "ace"
      "P"
    end
  end

  #####

  def self.first_turn(card1, card2, dealer_card)
    # Stand (S)
    # Hit (H)
    # Split (P)
    # Automatically win (W)

    # # PLAYER ONLY:
    # If you have a pair of aces you must always split them.
    # If your cards sum up to a value within the range [17, 20] you should always stand.
    # If your cards sum up to 11 or lower you should always hit.

    # # DEALER ONLY:
    # If the dealer does have any of those cards (ace, a figure or a ten) then you'll have to stand and wait for the reveal of the other card.

    # # DEPENDS
    # If you have a Blackjack (two cards that sum up to a value of 21), and the dealer does not have an ace, a figure or a ten then you automatically win.
    # If the dealer does have any of those cards (ace, a figure or a ten) then you'll have to stand and wait for the reveal of the other card.
    # If your cards sum up to a value within the range [12, 16] you should always stand unless the dealer has a 7 or higher, in which case you should always hit.

      check_Split_P(card1, card2, dealer_card) ||
    check_Stand_S(card1, card2, dealer_card) ||
      check_Hit_H(card1, card2, dealer_card) ||
      check_Win_W(card1, card2, dealer_card) # ||
      # raise "think more"
  end
end
