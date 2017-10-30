class Oystercard

  DEFAULT_BALANCE = 0
  LIMIT = 90
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    error = "Can't top-up over the balance limit of £#{Oystercard::LIMIT}"
    raise error if limit?(amount)
    @balance += amount.to_i
  end

  private

  def limit?(amount)
    @balance + amount.to_i > Oystercard::LIMIT
  end
end
