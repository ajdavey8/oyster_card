class Station
  attr_reader :name, :zone

  STATIONS = {
    Waterloo: 1,
    Euston: 2,
    Goodge_Street: 2,
    Peckham: 5,
    Forest_Hill: 6
  }

  def initialize(name, zone)
    @name = name
    @zone = zone
  end

  

end
