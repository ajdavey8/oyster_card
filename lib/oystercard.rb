class Oystercard

  DEFAULT_BALANCE = 0
  LIMIT = 90
  MINIMUM = 1
  attr_reader :balance, :entry_station

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
  end

  def top_up(amount)
    error = "Can't top-up over the balance limit of £#{LIMIT}"
    raise error if limit?(amount)
    @balance += amount.to_i
  end

  def touch_in(station)
    raise "Sorry insufficent funds for journey"  if sufficent_funds?
    raise "Can't touch in if in journey" if in_journey?
    @entry_station = station
  end

  def touch_out(fare = MINIMUM)
    raise "Can't touch out if not touched in" unless in_journey?
    deduct(fare)
    @entry_station = nil
  end

  private

  def limit?(amount)
    @balance + amount.to_i > LIMIT
  end

  def in_journey?
    return false if @entry_station == nil
    true
  end

  def sufficent_funds?
    @balance < MINIMUM
  end

  def deduct(amount)
    @balance -= amount.to_i
  end
end
