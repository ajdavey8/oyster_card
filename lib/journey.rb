class Journey

  MINIMUM = 1
  PENALTY_FARE = 6

  attr_reader :journeys
  attr_accessor :entry_station

  def initialize
    @journeys = []
    @entry_station = nil
  end

  def in_journey?
    !@entry_station.nil?
  end

  def adding_journey(exit_station)
    @journeys << { entry: @entry_station, exit: exit_station }
  end

  def fare
    return PENALTY_FARE if @journeys.last[:entry].nil? || @journeys.last[:exit].nil?
    MINIMUM
  end
end
