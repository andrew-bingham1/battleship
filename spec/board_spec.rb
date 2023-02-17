require 'rspec'
require './lib/board'

RSpec.describe Board do
  it 'exists' do
    board = Board.new
    expect(board).to be_a(Board)
  end

  it 'board contains cells' do
    board = Board.new
    expect(board.cells).to eq()
  end

  # need additional tests for cells
  # and need to fix above test

  it 'validating coordinates' do
    board = Board.new
    expect(board.valid_coordinate?('A1')).to eq(true)
    expect(board.valid_coordinate?('D4')).to eq(true)
    expect(board.valid_coordinate?('A5')).to eq(false)
    expect(board.valid_coordinate?('E1')).to eq(false)
    expect(board.valid_coordinate?('A22')).to eq(false)
  end
end