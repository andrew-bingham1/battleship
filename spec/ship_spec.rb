require 'rspec'
require './lib/ship'

RSpec.describe Ship do 
  describe '#initialize' do
    it 'can initialize' do 
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser).to be_a Ship
    end

    it 'has a name and length' do 
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.name).to eq("Cruiser")
      expect(cruiser.length).to eq(3)
    end

    it 'has health' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.health).to eq(3)
    end
  end

  describe '#sunk?' do
    it 'can check sink status' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.sunk?).to eq(false)
    end
  end

  describe '#hit' do
    it 'can be hit' do
      cruiser = Ship.new("Cruiser", 3)

      cruiser.hit 

      expect(cruiser.health).to eq(2)

      cruiser.hit 

      expect(cruiser.health).to eq(1)
    end

  end
end