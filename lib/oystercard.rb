require './lib/journey'

class Oystercard

  DEFAULT_BALANCE = 0
  LIMIT = 90

  attr_reader :balance, :journey

  def initialize(balance = DEFAULT_BALANCE, journey = Journey.new)
    @balance = balance
    @journey = journey
  end

  def top_up(amount)
    error = "Can't top-up over the balance limit of £#{LIMIT}"
    raise error if limit?(amount)
    @balance += amount.to_i
  end

  def touch_in(station)
    raise 'Sorry insufficent funds for journey' if sufficent_funds?
    @journey.entry_station = station
  end

  def touch_out(station)
    @journey.adding_journey(station)
    deduct(@journey.fare)
    @journey.entry_station = nil
  end

  private

  def limit?(amount)
    @balance + amount.to_i > LIMIT
  end

  def sufficent_funds?
    @balance < Journey::MINIMUM
  end

  def deduct(amount)
    @balance -= amount.to_i
  end
end
