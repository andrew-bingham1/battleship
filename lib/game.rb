class Game
  def initialize
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    input = gets.chomp.to_s

    case input
      when "p"
        computer = Board.new 
        player = Board.new 
        print "These are the game boards.\nThe top one is mine \nand the bottom is yours.\n" + computer.render + "\n" +  "===========\n" + player.render(true) 

        ### computer then takes a random sampling for 
        ### crusier and submarine based off hardcoded 
        ### valid placements and calls on the #place method 

        print "I have laid out my ships on the grid.
        You now need to lay out your two ships.
        The Cruiser is three units long and the Submarine is two units long.
        Enter the squares for the Cruiser (3 spaces)"

        ### program now takes user input and renders it into 
        ### useable info for the place method
        ### and places the ships 
        ### repeats for the second ship (sub)

        ##### if placement is not valid it should prompt the user 
        ##### Enter the squares for the Submarine (2 spaces):
        ##### C1 C3
        ##### Those are invalid coordinates. Please try again:

        ### user is prompted to pick a location to fire at beginning the game (maybe use loop)
        ### each time the there is a fire action the boards are 
        ### rerendered with the new info being displayed 
        ### feedback is also given in the form of a printed statement 


        ### 



      when "q" 
        print "restarts game"
    end

  end
end
