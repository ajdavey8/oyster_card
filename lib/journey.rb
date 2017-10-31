class Journey

  MINIMUM = 1
  PENALTY_FARE = 6

  attr_reader :journeys
  attr_accessor :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def in_journey?
    !@entry_station.nil?
  end

  def fare
    minimum_fare + penalty_fare
  end

  private

  def minimum_fare
    MINIMUM
  end

  def penalty_fare
    entry_station && exit_station ? 0 : PENALTY_FARE
  end

end
