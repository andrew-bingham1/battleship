class Game
  attr_accessor :player_shot,
                :computer_shot

  def initialize
    @player_shot = ""
    @computer_shot = ""
    @computer_shot_bank = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4",]
  end

  def start 
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    input = gets.chomp.to_s
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
    player_place_cruiser
  end

  def player_place_cruiser
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
    player_place_sub
  end

  def player_place_sub
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
   loop do 
      print "Enter the coordinate for your shot:\n"
      player_shot = gets.upcase.chomp
      computer.cells.each do |key, value|
        if player_shot == key
          if player.valid_coordinate?(player_shot) == true && value.fired_upon? == false 
            computer.fire(player_shot)
            break
          elsif player.valid_coordinate?(player_shot) == false || value.fired_upon? == true
            print "Please enter a valid coordinate:\n"
          end
        end
    end

    def computer_shoots
      computer_shot = @computer_shot_bank.sample
      @computer_shot_bank.delete(computer_shot)
      player.fire(computer_shot)
    end

    def player_feedback
      computer.cells.each do |key, value|
        if player_shot == key 
          if value.render == "M"
            print "Your shot on #{player_shot} was a miss.\n\n"
          elsif value.render == "H"
            print "Your shot on #{player_shot} was a hit.\n\n"
          elsif value.render == "X"
            print "Your shot sank my #{value.ship.name}!\n\n"
          end
        end
      end
    end

    def computer_feeback
      player.cells.each do |key, value|
        if computer_shot == key 
          if value.render == "M"
            print "My shot on #{computer_shot} was a miss.\n\n"
          elsif value.render == "H"
            print "My shot on #{computer_shot} was a hit.\n\n"
          elsif value.render == "X"
            print "Your shot sank my #{value.ship.name}!\n\n"
          end
        end
      end
    end

    def end_conditions
      if cruiser_p.sunk? == true && submarine_p.sunk? == true 
        print "I win"
        self.start
      elsif cruiser_c.sunk? == true && submarine_c.sunk? == true
        print "You win"
        self.start
      end
    end


end