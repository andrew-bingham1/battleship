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

  xit 'number of coordinates equal to ship length' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  xit 'number of coordinates are consecutive' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

  xit 'coordinates are not diagonal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 
    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

  xit 'valid coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Shp.new("Submarine", 2) 
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    expect(board.valid_placement?(submarine, ["B1", "C1"])).to eq(true)
  end
end