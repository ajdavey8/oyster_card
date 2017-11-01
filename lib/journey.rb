class Journey

  MINIMUM = 1
  PENALTY_FARE = 6

  attr_accessor :entry_station, :exit_station

  def initialize(entry_station)
    @exit_station = nil
    @fare = MINIMUM
    @penalty = nil
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
    @fare = 0
  end

  def calculate_fare
    return @penalty if !!@penalty
    @fare
  end

end
