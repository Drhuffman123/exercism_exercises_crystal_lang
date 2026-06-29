module Yacht
  enum Category
    Yacht
    Ones
    Twos
    Threes
    Fours
    Fives
    Sixes
    FullHouse
    FourOfAKind
    LittleStraight
    BigStraight
    Choice
  end

  def self.score_as_yacht(dice)
    if dice[0] == dice[1] == dice[2] == dice[3] == dice[4]
      50
    else
      0
    end
  end

  def self.score_as_xs(dice, x)
    dice.sum do |roll|
      if roll == x
        x
      else
        0
      end
    end
  end

  def self.score_as_ones(dice)
    score_as_xs(dice, 1)
  end

  def self.score_as_twos(dice)
    score_as_xs(dice, 2)
  end

  def self.score_as_threes(dice)
    score_as_xs(dice, 3)
  end

  def self.score_as_fours(dice)
    score_as_xs(dice, 4)
  end

  def self.score_as_fives(dice)
    score_as_xs(dice, 5)
  end

  def self.score_as_sixes(dice)
    score_as_xs(dice, 6)
  end

  def self.dice_min_sum(dice)
    dmin = dice.min
    dice.sum { |die|
      if die == dmin
        1
      else
        0
      end
    }
  end

  def self.dice_max_sum(dice)
    dmax = dice.max
    dice.sum { |die|
      if die == dmax
        1
      else
        0
      end
    }
  end

  def self.score_as_full_house(dice)
    count_dmin = dice_min_sum(dice)
    count_dmax = dice_max_sum(dice)
    counts_valid = (count_dmin == 3 && count_dmax == 2) || (count_dmin == 2 && count_dmax == 3)
    if dice.uniq.sort!.size == 2 && counts_valid
      dice.sum
    else
      0
    end
  end

  def self.score_as_four_of_a_kind(dice)
    dice_qty = Hash(Int32, Int32).new { |hash, key| hash[key] = 0 }
    dice.sort.map do |roll|
      dice_qty[roll] += 1
    end
    dice_qty.sum do |roll, qty|
      if qty >= 4
        roll * 4
      else
        0
      end
    end
  end

  def self.score_as_little_straight(dice)
    if dice.sort == [1, 2, 3, 4, 5]
      30
    else
      0
    end
  end

  def self.score_as_big_straight(dice)
    if dice.sort == [2, 3, 4, 5, 6]
      30
    else
      0
    end
  end

  def self.score_as_choice(dice)
    dice.sum
  end

  def self.score_singles(dice : Array(Int32), category : Category)
    if category == Category::Ones
      score_as_ones(dice)
    elsif category == Category::Twos
      score_as_twos(dice)
    elsif category == Category::Threes
      score_as_threes(dice)
    elsif category == Category::Fours
      score_as_fours(dice)
    elsif category == Category::Fives
      score_as_fives(dice)
    elsif category == Category::Sixes
      score_as_sixes(dice)
    end
  end

  def self.score_specials(dice, category)
    if category == Category::Yacht
      score_as_yacht(dice)
    elsif category == Category::FullHouse
      score_as_full_house(dice)
    elsif category == Category::FourOfAKind
      score_as_four_of_a_kind(dice)
    elsif category == Category::LittleStraight
      score_as_little_straight(dice)
    elsif category == Category::BigStraight
      score_as_big_straight(dice)
    elsif category == Category::Choice
      score_as_choice(dice)
    end
  end

  def self.score(dice : Array(Int32), category : Category)
    score_singles(dice, category) || score_specials(dice, category)
  end
end
