


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

    def render
      if @targeted == false
       return "."
      elsif @targeted == true && self.ship == nil
        return "M"
      elsif @targeted == true && self.ship != nil && self.ship.sunk != true
        return "H"
      elsif self.ship.sunk == true 
        return "X"
      end
    end

  # def render 
  #   if self.ship.sunk == true 
  #     puts "X"
  #     elsif ship.sunk == false && self.ship != nil
  #       puts "H"
  #     elsif @targeted == true && self.ship == nil
  #       puts "M"
  #     elsif @targeted == false
  #       puts "."
  #     else
  #       puts "render method error"
  #   end
  # end
end