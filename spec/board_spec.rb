require 'rspec'
require './lib/board'

RSpec.describe Board do
  it 'exists' do
    board = Board.new
    expect(board).to be_a(Board)
  end
end