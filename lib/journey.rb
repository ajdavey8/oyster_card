class Journey

  MINIMUM = 1
  PENALTY_FARE = 6

  attr_accessor :entry_station, :exit_station, :penalty, :fare

  def initialize(entry_station)
    @exit_station = nil
    @fare = MINIMUM
    @penalty = 0
    self.touch_in(entry_station)
  end

  def touch_in(station)
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
  end

  def add_penalty
    @penalty = PENALTY_FARE
  end

end
