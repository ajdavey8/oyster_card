require './lib/journey'

class JourneyLog

  attr_reader :current_journey

  def initialize
    @journeys = []
    @current_journey = nil
  end

  def start(entry_station)
    @current_journey = Journey.new(entry_station)
  end

  def finish(exit_station)
    @current_journey.touch_out(exit_station)
    store_journey
  end

  def in_journey?
    !!@current_journey
  end

  def penalise
    @current_journey.add_penalty
  end

  def get_fare
    @current_journey.calculate_fare
  end

  private

  def store_journey
    @journeys << @current_journey
    @current_journey = nil
  end

end
