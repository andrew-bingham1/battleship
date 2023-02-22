class Game
  attr_accessor :player_shot,
                :computer_shot

  attr_reader   :input,
                :computer,
                :player,
                :cruiser_c,
                :cruiser_p,
                :submarine_c,
                :submarine_p
              
  def initialize  
    @player_shot = ""
    @computer_shot = ""
    @computer_shot_bank = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4",]
    @input = ""
    @computer = computer = Board.new 
    @player = player = Board.new 
    @cruiser_p = cruiser_p = Ship.new("Cruiser", 3)
    @submarine_p = submarine_p = Ship.new("Submarine", 2)
    @cruiser_c = cruiser_c = Ship.new("Cruiser", 3)
    @submarine_c = submarine_c = Ship.new("Submarine", 2) 
    @player_shot = ""
    @computer_shot = ""
    
  end

  def start 
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    @input = gets.chomp.to_s
    start_logic
  end

  def start_logic
    if input == "p"
      self.setup
    elsif input == "q"
      self.start
    end
  end

  def setup
    computer_sub_loc = computer.valid_sub.sample 
    computer.place(submarine_c , computer_sub_loc)
  
    computer_cru_loc = computer.valid_cruiser.sample
    loop do 
      if computer.valid_placement?(cruiser_c, computer_cru_loc) == true
        computer.place(cruiser_c, computer_cru_loc)
        break
      else
        computer_cru_loc = computer.valid_cruiser.sample
      end
    end
    player_place_ships
  end

  def player_place_ships
    print "I have laid out my ships on the grid.\n"
    print "You now need to lay out your two ships.\n"
    print "The Cruiser is three units long and the Submarine is two units long.\n"
    print "Enter the squares for the Cruiser (3 spaces):\n"
    loop do 
      player_cruiser_array = gets.upcase.split(' ')
        if player.valid_cruiser.include?(player_cruiser_array) == true
          player.place(cruiser_p, player_cruiser_array)
          print "Your Cruiser has been placed at #{player_cruiser_array.to_s}\n"
          break 
        elsif player.valid_cruiser.include?(player_cruiser_array) == false 
          print "Those are invalid coordinates. Please try again:\n"
        end
    end
    print "Enter the squares for the Submarine (2 spaces):\n"
    loop do 
      player_sub_array = gets.upcase.split(' ')
        if player.valid_sub.include?(player_sub_array) == true
          player.place(submarine_p, player_sub_array)
          print "Your Submarine has been placed at #{player_sub_array.to_s}\n\n"
          break
        elsif player.valid_sub.include?(player_sub_array) == false 
          print "Those are invalid coordinates. Please try again:\n"
        end
    end
    turn
  end
  
  

  def render_boards
    print "*** Computer's Board ***\n\n"
    print computer.render + "\n"
    print "\n*** Your Board ***\n\n"
    print player.render(true) + "\n\n"
  end

  def player_fire_loop  
    puts "Enter the coordinate for your shot:"
    loop do
      @player_shot = gets.chomp.upcase
      if computer.valid_coordinate?(player_shot) && computer.cells[player_shot].fired_upon? == false
        computer.fire(player_shot)
        break
      else
        puts "Please enter a valid coordinate."
      end
    end
  end

  def computer_shoots
    @computer_shot = @computer_shot_bank.sample
    @computer_shot_bank.delete(computer_shot)
    player.fire(computer_shot)
  end

  def feedback
    computer.cells.each do |key, value|
      if @player_shot == key 
        if value.render == "M"
            print "\nYour shot on #{player_shot} was a miss.\n\n"
        elsif value.render == "H"
            print "\nYour shot on #{player_shot} was a hit.\n\n"
        elsif value.render == "X"
            print "\nYour shot sank my #{value.ship.name}!\n\n"
        end
      
      end
    end
    player.cells.each do |key, value|
      if @computer_shot == key 
        if value.render == "M"
            print "My shot on #{computer_shot} was a miss.\n\n"
        elsif value.render == "H"
            print "My shot on #{computer_shot} was a hit.\n\n"
        elsif value.render == "X"
            print "My shot sank your #{value.ship.name}!\n\n"
        end
      
      end
    end
  end

  def end_conditions
    if cruiser_p.sunk? == true && submarine_p.sunk? == true 
      print "I win!\n\n"
      wipe_boards
      self.start
    elsif cruiser_c.sunk? == true && submarine_c.sunk? == true
      print "You win!\n\n"
      wipe_boards
      self.start
    else 
      self.turn
    end
  end

  def wipe_boards
    computer.cells.each do |_key, value|
      value.ship = nil
      value.empty = true
      value.targeted = false
    end
    player.cells.each do |_key, value|
      value.ship = nil
      value.empty = true
      value.targeted = false
    end
  end

  def turn 
    render_boards
    player_fire_loop
    computer_shoots
    feedback
    end_conditions
  end

end