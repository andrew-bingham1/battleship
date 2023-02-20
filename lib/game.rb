class Game
  def initialize
    
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    input = gets.chomp.to_s

    case input
      when "p"
        print "\nLet's begin!\n"
        computer = Board.new 
        player = Board.new 
        cruiser_p = Ship.new("Cruiser", 3)
        submarine_p = Ship.new("Submarine", 2)
        cruiser_c = Ship.new("Cruiser", 3)
        submarine_c = Ship.new("Submarine", 2) 

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

        print "I have laid out my ships on the grid.\n"
        print "You now need to lay out your two ships.\n"
        print "The Cruiser is three units long and the Submarine is two units long.\n"
        print "Enter the squares for the Cruiser (3 spaces):\n"

        ### program now takes user input and renders it into 
        ### useable info for the place method
        ### and places the ships 
        ### repeats for the second ship (sub)
        
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


        loop do
          print "*** Computer's Board ***\n\n"
          print computer.render + "\n"
          print "\n*** Your Board ***\n\n"
          print player.render(true) + "\n"

          loop do 
            print "Enter the coordinate for your shot:\n"

            player_shot = gets.upcase.to_s
              if player.valid_coordinate?(player_shot) == false
                print "Please enter a valid coordinate:\n"
              elsif player.valid_coordinate?(player_shot) == true
                computer.fire(player_shot)
                break
              end
          end

          computer_shot = player.cells.sample 
          player.fire(computer_shot)

          if computer.cells[player_shot].render == "M"
             print "Your shot on #{player_shot} was a miss.\n"
          elsif computer.cells[player_shot].render == "H"
            print "Your shot on #{player_shot} was a hit.\n"
          end

          if player.cells[computer_shot].render == "M"
            print "My shot on #{computer_shot} was a miss.\n"
          elsif player.cells[computer_shot].render == "H"
            print "My shot on #{computer_shot} was a hit\n"
          end
          
        end
      
        

       
         
        
        # while crusier_p.sunk? != true && submarine_p.sunk? != true || crusier_c.sunk? != true && submarine_c.sunk? != true
        ### user is prompted to pick a location to fire at beginning the game (maybe use loop)
        ### each time the there is a fire action the boards are 
        ### rerendered with the new info being displayed 
        ### feedback is also given in the form of a printed statement 
          # end 

        ### END GAME 



      when "q" 
        print "restarts game"
    end

  end
end



# print "These are the game boards.\nThe top one is mine \nand the bottom is yours.\n" + computer.render + "\n" +  "===========\n" + player.render(true) 