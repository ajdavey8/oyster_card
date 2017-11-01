require './lib/journey'
require './lib/journeylog'

class Oystercard

  DEFAULT_BALANCE = 0
  LIMIT = 90

  attr_reader :balance, :journey_log

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    error = "Can't top-up over the balance limit of £#{LIMIT}"
    raise error if limit?(amount)
    @balance += amount.to_i
  end

  def touch_in(station)
    raise 'Sorry insufficent funds for journey' if sufficent_funds?
    touch_in_penalty if @journey_log.in_journey?
    @journey_log.start(station)
  end

  def touch_out(station)
    touch_out_penalty unless !@journey_log.in_journey?
    deduct(@journey_log.get_fare)
    @journey_log.finish(station)
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

  def touch_in_penalty
    @journey_log.penalise
    deduct(@journey_log.get_fare)
    @journey_log.finish(nil)
  end

  def touch_out_penalty
    @journey_log.start(nil)
    @journey_log.penalise
  end

end
