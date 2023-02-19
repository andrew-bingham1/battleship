class Game
  def initialize
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    input = gets.chomp.to_s

    case input
      when "p"
        computer = Board.new 
        player = Board.new 
        print 'This is my board'
        print computer.render
        print "==========="
        print "And this is yours"
        print player.render(true)
        print "Please pick the placement for your ships"

        ### computer then takes a random sampling for 
        ### crusier and submarine based off hardcoded 
        ### valid placements and calls on the #place method 

        ### program now takes user input and renders it into 
        ### useable info for the place method with prompts



      when "q" 
        print "restarts game"
    end

  end
end
