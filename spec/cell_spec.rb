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
    expect(cell.ship).to eq(cruiser)
  end

  it 'cell is emtpy true' do
    cell = Cell.new("B4")
    expect(cell.empty?).to eq(true)
  end

  it 'place_ship changes empty to false' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.empty?).to eq(false)
  end

  it 'fired upon is false' do
    cell = Cell.new("B4")
    expect(cell.fired_upon?).to eq(false)
  end

  it '#fire_upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    expect(cell.fired_upon?).to eq(true)
    expect(cell.ship.health).to eq(2)
  end

  it 'can render' do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")
  end

  it 'can render_2' do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    expect(cell_1.render).to eq("M")
  end

  it 'can render_2' do
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell_1.place_ship(cruiser)
    cell_1.fire_upon
    expect(cell_1.render).to eq("H")
  end
  

  it 'can render_2' do
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell_1.place_ship(cruiser)
    cruiser.hit
    cruiser.hit
    cell_1.fire_upon
    expect(cell_1.render).to eq("X")
  end

  it 'can render(true)' do
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell_1.place_ship(cruiser)
    expect(cell_1.render(true)).to eq("S")
  end

end