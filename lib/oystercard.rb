require './lib/journey'
require './lib/journeylog'

class Oystercard

  attr_reader :balance, :journey_log

  DEFAULT_BALANCE = 0
  LIMIT = 90

  @@messages = {
    :max_limit => "Can't top-up over the balance limit of £#{LIMIT}",
    :no_funds => "Sorry insufficent funds for journey",
  }

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise @@messages[:max_limit] if limit?(amount)
    @balance += amount.to_i
  end

  def touch_in(station, zone)
    raise @@messages[:no_funds] if sufficent_funds?
    touch_in_penalty if @journey_log.in_journey?
    @journey_log.start(station, zone)
  end

  def touch_out(station, zone)
    touch_out_penalty unless @journey_log.in_journey?
    deduct(@journey_log.get_fare(zone))
    @journey_log.finish(station, zone)
    # @journey_log.get_zones_travelled

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
