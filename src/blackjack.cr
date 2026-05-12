module Blackjack
  def self.parse_card_lows(card)
    if card == "two"
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
    end
  end

  def self.parse_card_highs(card)
    if ["ten", "jack", "queen", "king"].includes?(card)
      10
    elsif card == "ace"
      11
    end
  end

  def self.parse_card(card)
    (parse_card_lows(card) || parse_card_highs(card) || 0)
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

  def self.check_stand_s(card1, card2, dealer_card)
    if (
         (17..21).includes?(parse_card(card1) + parse_card(card2)) &&
         [11, 10].includes?(parse_card(dealer_card))
       ) ||
       ((parse_card(card1) + parse_card(card2)) == 21 && [11].includes?(parse_card(dealer_card))) ||
       (card1 == "king" || card2 == "king" && (parse_card(dealer_card) < 7))
      "S"
    end
  end

  def self.check_hit_h(card1, card2, dealer_card)
    if (2..11).includes?(parse_card(card1) + parse_card(card2)) ||
       (12..16).includes?(parse_card(card1) + parse_card(card2))
      "H"
    end
  end

  def self.check_win_w(card1, card2, dealer_card)
    if (card1 == "ace" && parse_card(card2) == 10) || (card2 == "ace" && parse_card(card1) == 10)
      "W"
    end
  end

  def self.check_split_p(card1, card2, dealer_card)
    if card1 == "ace" && card2 == "ace" && dealer_card == "ace"
      "P"
    end
  end

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

    check_split_p(card1, card2, dealer_card) ||
      check_stand_s(card1, card2, dealer_card) ||
      check_hit_h(card1, card2, dealer_card) ||
      check_win_w(card1, card2, dealer_card)
  end
end
