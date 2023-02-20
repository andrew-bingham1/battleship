class Board
  attr_reader :cells,
              :valid_cruiser,
              :valid_sub

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
     }
     @valid_cruiser = [['A1', 'B1', 'C1'], ['B1', 'C1', 'D1'], ['A2', 'B2', 'C2'], ['B2', 'C2', 'D2'], ['A3', 'B3', 'C3'], ['B3', 'C3', 'D3'], ['A4', 'B4', 'C4'], ['B4', 'C4', 'D4'], ['A1', 'A2', 'A3'], ['B1', 'B2', 'B3'], ['C1', 'C2', 'C3'], ['D1', 'D2', 'D3'], ['A2', 'A3', 'A4'], ['B2', 'B3', 'B4'], ['C2', 'C3', 'C4'], ['D2', 'D3', 'D4']]
     @valid_sub = [['A1', 'A2'], ['A2', 'A3'], ['A3', 'A4'], ['B1', 'B2'], ['B2', 'B3'], ['B3', 'B4'], ['C1', 'C2'], ['C2', 'C3'], ['C3', 'C4'], ['D1', 'D2'], ['D2', 'D3'], ['D3', 'D4'], ['A1', 'B1'], ['B1', 'C1'], ['C1', 'D1'], ['A2', 'B2'], ['B2', 'C2'], ['C2', 'D2'], ['A3', 'B3'], ['B3', 'C3'], ['C3', 'D3'], ['A4', 'B4'], ['B4', 'C4'], ['C4', 'D4']]
     
  end

  def valid_coordinate?(loc)
    if self.cells.keys.include?(loc)
      return true
    else
      return false
    end
  end

 def valid_placement?(ship, coordinates)
  if ship.length != coordinates.length
    return false
  end
  if ship.name == "Cruiser"
    if valid_cruiser.include?(coordinates) == false
      return false 
    end
  elsif ship.name == "Submarine"
    if valid_sub.include?(coordinates) == false 
      return false
    end
  end
  num_of_trues = 0 
      coordinates.each do |coor|
        self.cells.each do |key, value|
          if coor == key
            if value.empty? == true 
               num_of_trues += 1
              if num_of_trues == ship.length
                return true
              end
            elsif value.empty? == false
              return false
            end
          end
        end
      end
 end
  

  def place(ship_name, coordinates) 
      coordinates.each do |coor|
        self.cells.each do |key, value|
          if coor == key
            value.ship = ship_name
            value.empty = false
          end
        end
      end 
  end

  def render(board_show_ship = false)

    board_rendering = "  1 2 3 4 \n" +
                      "A #{self.cells["A1"].render(board_show_ship)} #{self.cells["A2"].render(board_show_ship)} #{self.cells["A3"].render(board_show_ship)} #{self.cells["A4"].render(board_show_ship)}\n" +
                      "B #{self.cells["B1"].render(board_show_ship)} #{self.cells["B2"].render(board_show_ship)} #{self.cells["B3"].render(board_show_ship)} #{self.cells["B4"].render(board_show_ship)}\n" +
                      "C #{self.cells["C1"].render(board_show_ship)} #{self.cells["C2"].render(board_show_ship)} #{self.cells["C3"].render(board_show_ship)} #{self.cells["C4"].render(board_show_ship)}\n" +
                      "D #{self.cells["D1"].render(board_show_ship)} #{self.cells["D2"].render(board_show_ship)} #{self.cells["D3"].render(board_show_ship)} #{self.cells["D4"].render(board_show_ship)}"
  end

  def fire(location)
    self.cells.each do |key, value|
      if location == key
        value.fire_upon
      end
    end
  end
end


