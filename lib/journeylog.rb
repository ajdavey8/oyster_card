require './lib/journey'

class JourneyLog
  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @hash = { entry: entry_station }
  end

end
