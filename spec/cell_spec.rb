require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")
    expect(cell).to be_a(Cell)
  end

  it 'attributes exist' do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
  end
end