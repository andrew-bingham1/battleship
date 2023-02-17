class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true  
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @empty
  end
end