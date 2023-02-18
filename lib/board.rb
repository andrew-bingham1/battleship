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
    range1 = 'A1'..'A4'
    range2 = 'B1'..'B4' 
    range3 = 'C1'..'C4'
    range4 = 'D1'..'D4'
    superrange = [range1, range2, range3, range4] 
    superrange.each do |range|
      if range.each_cons(ship.length).to_a.include?(loc_arr) == true && ship.length == loc_arr.length
        return true
      else
        return false 
      end
    end
  end
end