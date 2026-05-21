class SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      3.213
    elsif balance < 1000
      0.5
    elsif balance < 5000
      1.621
    else # if balance > 5000

      2.475
    end
  end

  def self.interest(balance)
    (interest_rate(balance) * balance)/100
  end

  def self.annual_balance_update(balance)
    inter = interest(balance)

    inter + balance
  end

  def self.bal_est_add_yr(prev_bal, target_balance, yrs_gone = 0)
    yrs_gone += 1

    wip_balance = annual_balance_update(prev_bal)

    if wip_balance >= target_balance
      [wip_balance, yrs_gone]
    else
      bal_est_add_yr(wip_balance, target_balance, yrs_gone)
    end
  end

  def self.years_before_desired_balance(current_balance, target_balance)
    bal_est_add_yr(current_balance, target_balance)[1]
  end
end
