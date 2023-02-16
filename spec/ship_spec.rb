require 'rspec'
require './lib/ship'

RSpec.describe Ship do 
  describe '#initialize' do
    it 'can initialize' do 
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser).to be_a Ship
    end
  end
end