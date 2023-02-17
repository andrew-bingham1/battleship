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
end