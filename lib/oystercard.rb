require './lib/journey'

class Oystercard

  DEFAULT_BALANCE = 0
  LIMIT = 90

  attr_reader :balance, :journey, :journeys

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey = Journey.new(nil)
    @journeys = []
  end

  def top_up(amount)
    error = "Can't top-up over the balance limit of £#{LIMIT}"
    raise error if limit?(amount)
    @balance += amount.to_i
  end

  def touch_in(station)
    raise 'Sorry insufficent funds for journey' if sufficent_funds?
    deduct(@journey.fare) if @journey.in_journey?
    @journey = Journey.new(station)
  end

  def touch_out(station)
    adding_journey(station)
    @journey.exit_station = station
    deduct(@journey.fare)
    @journey.entry_station = nil
  end

  private

  def adding_journey(exit_station)
    @journeys << { entry: @journey.entry_station, exit: exit_station }
  end

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
