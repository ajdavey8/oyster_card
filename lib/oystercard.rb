class Oystercard

  DEFAULT_BALANCE = 25

  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    @balance += amount.to_i
  end
end
