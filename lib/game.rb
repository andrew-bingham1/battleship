class Game
  def initialize
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    input = gets.chomp.to_s

    case input
      when "p"
        print "Let's begin!"
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

        print "I have laid out my ships on the grid.
        You now need to lay out your two ships.
        The Cruiser is three units long and the Submarine is two units long.
        Enter the squares for the Cruiser (3 spaces)"


        require 'pry'; binding.pry
         

      

        

        ### program now takes user input and renders it into 
        ### useable info for the place method
        ### and places the ships 
        ### repeats for the second ship (sub)

        ##### if placement is not valid it should prompt the user 
        ##### Enter the squares for the Submarine (2 spaces):
        ##### C1 C3
        ##### Those are invalid coordinates. Please try again:
         
        
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