require './lib/journey'

class JourneyLog

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
    return @journeys[-1].get_fare
  end

  def in_journey?
    !!@current_journey
  end

  def penalise
    @current_journey.add_penalty
  end

  def get_fare
    return @current_journey.penalty if !@current_journey.penalty
    @current_journey.fare
  end

  private

  def store_journey
    @journeys << @current_journey
    @current_journey = nil
  end

end
