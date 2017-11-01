require './lib/journey'

class JourneyLog
  def initialize
    @journeys = []
  end

  def start(entry_station)
    @current_journey = Journey.new(entry_station)
  end

  def finish(exit_station)
    @current_journey.touch_out(exit_station)
    store_journey
  end

  private

  def store_journey
    @journeys << @current_journey
    @current_journey = nil
  end
end
