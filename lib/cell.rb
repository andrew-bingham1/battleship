class Cell
  attr_reader :coordinate,
              :ship,
              :targeted

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @targeted = false
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
  end

  def empty?
    @empty
  end

  def fired_upon?
    @targeted
  end

  def fire_upon
    @targeted = true
    if ship != nil
       self.ship.hit
    end
  end
end