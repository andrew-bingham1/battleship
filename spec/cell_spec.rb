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

  it 'can contain ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.ship_in_cell).to eq(cruiser)
  end
end