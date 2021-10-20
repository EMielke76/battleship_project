require './lib/ship'

RSpec.describe 'ship' do
  describe 'Ship class' do
    before :each do
      @cruiser = Ship.new("Cruiser", 3)
    end

    it 'exists' do

      expect(@cruiser).to be_a(Ship)
    end

    it 'has a length' do

      expect(@cruiser.length).to eq(3)
    end

    it 'is unsinkable' do

      expect(@cruiser.sunk?).to eq(false)
    end

    it 'can lose health' do

      @cruiser.hit
      expect(@cruiser.health).to eq(2)
      @cruiser.hit
      expect(@cruiser.health).to eq(1)
      expect(@cruiser.sunk?).to eq(false)
      @cruiser.hit
      expect(@cruiser.health).to eq(0)
      expect(@cruiser.sunk?).to eq(true)
    end
  end
end
