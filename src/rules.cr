class Rules
  def bonus_points?(power_up_active, touching_bandit)
    # raise "Please implement the Rules#bonus_points? method"

    if power_up_active && touching_bandit
      true
    else
      false
    end
  end

  def score?(touching_power_up, touching_crystal)
    # raise "Please implement the Rules#score? method"

    touching_power_up || touching_crystal
  end

  def lose?(power_up_active, touching_bandit)
    # raise "Please implement the Rules#lose? method"

    touching_bandit && !power_up_active
  end

  def win?(has_picked_up_all_crystals, power_up_active, touching_bandit)
    # raise "Please implement the Rules#win? method"

    has_picked_up_all_crystals && !lose?(power_up_active, touching_bandit)
  end
end
