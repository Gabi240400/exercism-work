module SavingsAccount
  def self.interest_rate(balance)
    # if balance < 0
    #   3.213 * balance / 100
    # elsif balance < 1000
    #   0.5 * balance / 100
    # elsif balance < 5000
    #   1.621 * balance / 100
    # else
    #   2.475 * balance / 100
    # end
    if balance < 0
      3.213
    elsif balance < 1000
      0.5
    elsif balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    balance + interest_rate(balance) * balance / 100
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    year = 0
    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      year += 1
    end
    year
  end
end
