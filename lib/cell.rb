class Cell
  attr_reader :coordinate,
              :targeted

  attr_accessor :ship,
                :empty

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

  def render(show_ship = false)
    if @targeted == false && show_ship == false
        return "."
      elsif @targeted == false && show_ship == true 
        return "S"
      elsif @targeted == true && self.ship == nil
        return "M"
      elsif @targeted == true && self.ship != nil && self.ship.sunk != true
        return "H"
      elsif self.ship.sunk == true 
        return "X"
    end
  end

end