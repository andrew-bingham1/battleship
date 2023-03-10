require 'rspec'
require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  it 'exists' do
    board = Board.new
    expect(board).to be_a(Board)
  end

  it 'board contains cells' do
    board = Board.new
    expect(board.cells).to be_a(Hash)
    expect(board.cells.keys.first).to eq("A1")
    expect(board.cells.values.first).to be_a(Cell)
    expect(board.cells.keys.count).to eq(16)
  end

  it 'validating coordinates' do
    board = Board.new
    expect(board.valid_coordinate?('A1')).to eq(true)
    expect(board.valid_coordinate?('D4')).to eq(true)
    expect(board.valid_coordinate?('A5')).to eq(false)
    expect(board.valid_coordinate?('E1')).to eq(false)
    expect(board.valid_coordinate?('A22')).to eq(false)
  end

  it 'number of coordinates equal to ship length' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it 'number of coordinates are consecutive' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 
   
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

  it 'coordinates are not diagonal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 
    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

  it 'valid coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    expect(board.valid_placement?(submarine, ['B1', 'C1'])).to eq(true)
  end

  it 'place method' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)  
    board.place(cruiser, ["A1", "A2", "A3"]) 
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"] 
    cell_3 = board.cells["A3"] 
    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
    expect(cell_3.ship == cell_2.ship).to eq(true)
  end

  it 'overlapping ships' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(submarine, ['A1', 'B1'])).to eq(false)
  end
  
  it 'render method' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)  
    board.place(cruiser, ["A1", "A2", "A3"])
    expect(board.render).to eq("  1 2 3 4 \nA . . . .\nB . . . .\nC . . . .\nD . . . .")
  end

  it 'render method with argument true' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)  
    board.place(cruiser, ["A1", "A2", "A3"])
    expect(board.render(true)).to eq("  1 2 3 4 \nA S S S .\nB . . . .\nC . . . .\nD . . . .")
  end

  it 'hit and rendered on board' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)  
    board.place(cruiser, ["A1", "A2", "A3"])
    board.fire("A2")
    expect(board.render).to eq("  1 2 3 4 \nA . H . .\nB . . . .\nC . . . .\nD . . . .")
  end

  it 'miss and rendered on board' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)  
    board.place(cruiser, ["A1", "A2", "A3"])
    board.fire("B3")
    expect(board.render).to eq("  1 2 3 4 \nA . . . .\nB . . M .\nC . . . .\nD . . . .")
  end

  it 'sunk ship and rendered on board' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)  
    board.place(cruiser, ["A1", "A2", "A3"])
    board.fire("A1")
    board.fire("A2")
    board.fire("A3")
    expect(board.render).to eq("  1 2 3 4 \nA X X X .\nB . . . .\nC . . . .\nD . . . .")
    expect(cruiser.sunk?).to eq(true)
  end
end