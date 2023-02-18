class Board
  attr_reader :cells

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
  end

  def valid_coordinate?(loc)
    if self.cells.keys.include? (loc)
      return true
    else
      return false
    end
  end

  def valid_placement?(ship, loc_arr)
    valid_cruiser = [['A1', 'B1', 'C1'], ['B1', 'C1', 'D1'], ['A2', 'B2', 'C2'], ['B2', 'C2', 'D2'], ['A3', 'B3', 'C3'], ['B3', 'C3', 'D3'], ['A4', 'B4', 'C4'], ['B4', 'C4', 'D4'], ['A1', 'A2', 'A3'], ['B1', 'B2', 'B3'], ['C1', 'C2', 'C3'], ['D1', 'D2', 'D3'], ['A2', 'A3', 'A4'], ['B2', 'B3', 'B4'], ['C2', 'C3', 'C4'], ['D2', 'D3', 'D4']]
    valid_sub = [['A1', 'A2'], ['A2', 'A3'], ['A3', 'A4'], ['B1', 'B2'], ['B2', 'B3'], ['B3', 'B4'], ['C1', 'C2'], ['C2', 'C3'], ['C3', 'C4'], ['D1', 'D2'], ['D2', 'D3'], ['D3', 'D4'], ['A1', 'B1'], ['B1', 'C1'], ['C1', 'D1'], ['A2', 'B2'], ['B2', 'C2'], ['C2', 'D2'], ['A3', 'B3'], ['B3', 'C3'], ['C3', 'D3'], ['A4', 'B4'], ['B4', 'C4'], ['C4', 'D4']]
  
    loc_arr.each do |coor|
      self.cells.each do |key, value|
        if coor == key
          if value.empty? == true
            if ship.name == "Cruiser"
              if valid_cruiser.include?(loc_arr) == true && ship.length == loc_arr.length
                return true
              else
                return false
              end
            elsif ship.name == "Submarine"
              if valid_sub.include?(loc_arr) == true && ship.length == loc_arr.length
                return true
              else
                return false
              end
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
end


 # def valid_placement?(ship, loc_arr)
  #   range1 = 'A1'..'A4'
  #   range2 = 'B1'..'B4' 
  #   range3 = 'C1'..'C4'
  #   range4 = 'D1'..'D4'
  #   superrange = [range1, range2, range3, range4] 
  #   superrange.each do |range|
  #     if range.each_cons(ship.length).to_a.include?(loc_arr) == true && ship.length == loc_arr.length
  #       return true
  #     else
  #       return false 
  #     end
  #   end
  # end