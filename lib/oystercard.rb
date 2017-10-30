class Oystercard

  DEFAULT_BALANCE = 0
  LIMIT = 90
  MINIMUM = 1
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    error = "Can't top-up over the balance limit of £#{LIMIT}"
    raise error if limit?(amount)
    @balance += amount.to_i
  end

  def deduct(amount)
    @balance -= amount.to_i
  end

  def touch_in
    raise "Sorry insufficent funds for journey"  if sufficent_funds?
    raise "Can't touch in if in journey" if in_journey?
    @in_journey = true
  end

  def touch_out
    raise "Can't touch out if not touched in" unless in_journey?
    @in_journey = false
  end

  private

  def limit?(amount)
    @balance + amount.to_i > LIMIT
  end

  def in_journey?
    @in_journey
  end

  def sufficent_funds?
    @balance < MINIMUM
  end
end
