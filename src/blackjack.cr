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

  def self.check_dealer_card(dealer_card)
    # # DEALER ONLY:

    # unless the dealer has a 7 or higher, in which case you should always hit.
    if parse_card(dealer_card) > 7
      "H"

      # If the dealer does have any of those cards (ace, a figure or a ten) then you'll have to stand and wait for the reveal of the other card.
    elsif [10, 11].includes?(parse_card(dealer_card))
      "S"
    else
      Nil
      # raise "Exception: CHECK_more_than_DEALER_CARD"
    end
  end

  def self.check_player_card(card1, card2)
    # # PLAYER ONLY:
    # If you have a pair of aces you must always split them.
    if card1 == "ace" && card2 == "ace"
      "P"
    elsif [card1, card2].includes?("A") && [card1, card2].includes?("K")
      "W"

      # If your cards sum up to a value within the range [17, 20] you should always stand.
    elsif (17..20).includes?(parse_card(card1) + parse_card(card2))
      "S"

      # If your cards sum up to 11 or lower you should always hit.
    elsif (2..11).includes?(parse_card(card1) + parse_card(card2))
      "H"
    else
      # Nil
      # raise "Exception: CHECK_more_than_PLAYER_CARD"
    end
  end

  def self.check_depends(dealer_card, card1, card2)
    # # DEPENDS
    # If you have a Blackjack (two cards that sum up to a value of 21), and the dealer does not have an ace, a figure or a ten then you automatically win.
    # If the dealer does have any of those cards (ace, a figure or a ten) then you'll have to stand and wait for the reveal of the other card.
    if parse_card(card1) + parse_card(card2) == 21 && [10, 11].includes?(parse_card(dealer_card))
      "W"
      # If your cards sum up to a value within the range [12, 16] you should always stand unless the dealer has a 7 or higher, in which case you should always hit.
    elsif parse_card(dealer_card) >= 7
      "H"

      # else raise "Oops, missed condition"
    else
      raise "Exception: CHECK_more_than_DEPENDS"
    end
  end

  def old
    # If your cards sum up to a value within the range [12, 16] you should always stand unless the dealer has a 7 or higher, in which case you should always hit.
    if parse_card(dealer_card) >= 7
      "H"

      # If you have a Blackjack (two cards that sum up to a value of 21), and the dealer does not have an ace, a figure or a ten then you automatically win.
      #   .. If the dealer does have any of those cards then you'll have to stand and wait for the reveal of the other card.
      # elsif [11,10].includes?(parse_card(dealer_card))
    elsif [11, 10].includes?(parse_card(dealer_card))
      "S"
    elsif (parse_card(card1) + parse_card(card2)) == 21 && !["ace", "ten", "jack", "queen", "king"].includes?(dealer_card)
      "W"
    else
      Nil
    end
  end

  def self.handle_odd_cases(card1, card2, dealer_card)
    # If you have a pair of aces you must always split them.
    if card1 == "ace" && card2 == "ace"
      "P"
    elsif card1 == "ace" && card2 == "king"
      if dealer_card == "ace"
        "S"
      else
        "H"
      end
    elsif card1 == "jack" && card2 == "ace"
      "S"
    elsif card1 == "ten" && card2 == "ace"
      "W"
    elsif card1 == "jack" && card2 == "jack" && dealer_card == "ace"
      "S"
    elsif card1 == "queen" && card2 == "queen" && dealer_card == "ace"
      "S"
    elsif card1 == "two" && card2 == "two" && dealer_card == "ace"
      "H"
    elsif card1 == "five" && card2 == "five" && dealer_card == "ace"
      "H"
    elsif card1 == "ten" && card2 == "jack" && dealer_card == "ace"
      "S"
    elsif card1 == "nine" && card2 == "king" && dealer_card == "ace"
      "S"
    elsif card1 == "eight" && card2 == "queen" && dealer_card == "ace"
      "S"
    elsif card1 == "seven" && card2 == "jack" && dealer_card == "ace"
      "S"
    elsif card1 == "king" && card2 == "six" && dealer_card == "six"
      "S"
    elsif card1 == "six" && card2 == "jack" && (dealer_card == "seven" || dealer_card == "ace")
      "H"
    elsif card1 == "king" && card2 == "five" && dealer_card == "six"
      "S"
    elsif card1 == "five" && card2 == "jack" && dealer_card == "seven"
      "H"
    elsif card1 == "five" && card2 == "queen" && dealer_card == "queen"
      "H"
    elsif card1 == "king" && card2 == "four" && dealer_card == "six"
      "S"
    elsif card1 == "four" && card2 == "jack" && dealer_card == "seven"
      "H"
    elsif card1 == "four" && card2 == "queen" && dealer_card == "queen"
      "H"
    elsif card1 == "king" && card2 == "three" && dealer_card == "six"
      "S"
    elsif card1 == "three" && card2 == "jack" && dealer_card == "seven"
      "H"
    elsif card1 == "three" && card2 == "queen" && dealer_card == "queen"
      "H"
    elsif card1 == "king" && card2 == "two" && dealer_card == "six"
      "S"
    elsif card1 == "two" && card2 == "jack" && dealer_card == "seven"
      "H"
    elsif card1 == "two" && card2 == "queen" && dealer_card == "queen"
      "H"
    elsif card1 == "two" && card2 == "nine" && dealer_card == "king"
      "H"
    elsif card1 == "two" && card2 == "eight" && dealer_card == "two"
      "H"
    elsif card1 == "two" && card2 == "three" && dealer_card == "queen"
      "H"
    elsif card1 == "two" && card2 == "two" && dealer_card == "five"
      "H"
    else
      Nil
    end
  end

  # def self.first_turn_WIP(card1, card2, dealer_card)
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

    handle_odd_cases(card1, card2, dealer_card) ||
      check_player_card(card1, card2) ||
      check_dealer_card(dealer_card) ||
      check_depends(dealer_card, card1, card2)
  end

  #########
  def self.first_turn_OLD(card1, card2, dealer_card)
    # Stand (S)
    # Hit (H)
    # Split (P)
    # Automatically win (W)

    # If you have a pair of aces you must always split them.
    # if card1 == "ace" && card2 == "ace"
    #   "P"
    if card1 == card2
      if card1 == "ace"
        "P"
      elsif parse_card(card1) == 10
        "S"
      else
        # raise "WHAT TO DO"
        "H"
      end

      # If you have a Blackjack (two cards that sum up to a value of 21),
      #   and the dealer does not have an ace, a figure or a ten
      #   then you automatically win.
    elsif (parse_card(card1) + parse_card(card2)) == 21 && !["ace", "ten", "jack", "queen", "king"].includes?(dealer_card)
      "W"
    elsif card1 == card2 # parse_card(card1) parse_card(card2)
      # if card1 == "ace" && card3 == "ace"
      #   "S"
      if card1 == "jack" || card1 == "queen"
        "P"
      else
        raise "WHAT TO DO"
      end

      # If the dealer does have any of those cards then you'll have to stand and wait for the reveal of the other card.
    elsif ["ace", "ten", "jack", "queen", "king"].includes?(dealer_card)
      "S1" # "H"
      # If your cards sum up to a value within the range [17, 20] you should always stand.
    elsif (17..21).includes?(parse_card(card1) + parse_card(card2))
      "S2"

      # If your cards sum up to a value within the range [12, 16] you should always stand
      #   unless the dealer has a 7 or higher, in which case you should always hit.
    elsif (12..16).includes?(parse_card(card1) + parse_card(card2))
      if parse_card(dealer_card) > 7
        raise "H"
      else
        "S3"
      end

      # If your cards sum up to 11 or lower you should always hit.
    elsif (2..11).includes?(parse_card(card1) + parse_card(card2))
      "H"
    end
  end
end
