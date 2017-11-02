require './lib/station.rb'

class Journey

  MINIMUM = 1
  PENALTY_FARE = 6

  attr_accessor :entry_station, :exit_station, :calculate_zones_travelled

  def initialize(entry_station, zone)
    self.touch_in(entry_station, zone)
    @exit_station = nil
    @fare = MINIMUM
    @penalty = nil
  end

  def touch_in(station, zone)
    @entry_station = Station.new(station, zone)
    @entry_zone = zone
  end

  def touch_out(station, zone)
    @exit_station = Station.new(station, zone)
    @exit_zone = zone
  end

  def add_penalty
    @penalty = PENALTY_FARE
    @fare = MINIMUM * calculate_zones_travelled
  end

  def calculate_fare(zone)
    return @penalty if !!@penalty
    @fare = MINIMUM * calculate_zones_travelled(zone)

  end

  def calculate_zones_travelled(zone)
     @entry_zone - zone
  end


end
