require_relative 'weather.rb'
AIRPORT_CAPACITY = 12

class Airport

  attr_reader :planes,:capacity
  attr_writer :planes

  def initialize(capacity = AIRPORT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def full?
    self.planes.count == AIRPORT_CAPACITY
  end

  def plane_landed(plane)
    @planes << plane
  end

  def plane_taken_off(plane)
    @planes.delete(plane)
  end

end
