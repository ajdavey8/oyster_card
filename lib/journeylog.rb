require './lib/journey'

class JourneyLog

  attr_reader :current_journey

  def initialize
    @journeys = []
    @current_journey = nil
  end

  def start(station, zone)
    @current_journey = Journey.new(station, zone)
  end

  def finish(station, zone)
    @current_journey.touch_out(station, zone)
    store_journey
  end

  def in_journey?
    !!@current_journey
  end

  def penalise
    @current_journey.add_penalty
  end

  def get_fare(zone)
    @current_journey.calculate_fare(zone)
  end

  private

  def store_journey
    @journeys << @current_journey
    @current_journey = nil
  end
end
