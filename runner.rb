require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

computer = Board.new 
player = Board.new 
cruiser_p = Ship.new("Cruiser", 3)
submarine_p = Ship.new("Submarine", 2)
cruiser_c = Ship.new("Cruiser", 3)
submarine_c = Ship.new("Submarine", 2) 

#type game = Game.new to start the game 
require 'pry'; binding.pry