require_relative 'airport.rb'

class Plane

  attr_reader :landed,:plane
  attr_writer :landed

  def initialize(landed = false)
    @landed = landed
  end

  def land(airport,weather)
    raise ("This plane has already landed") if landed
    raise ("Cannot land planes if the weather if stormy") if weather == "Stormy"
    raise ("Sorry, Airport is full, please fly to another") if airport.full?
    @landed = true
    airport.plane_landed(self)
  end

  def take_off(airport,weather)
    raise ("That plane is not in this airport") unless airport.planes.include?(self)
    raise ("Cannot take off in stormy weather") if weather == "Stormy"
    @landed = false
    airport.plane_taken_off(self)

  end

end
