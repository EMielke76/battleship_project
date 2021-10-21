require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before :each do
    @cell = Cell.new("B4")
  end
  it 'exists' do

    expect(@cell).to be_a(Cell)
  end

  it 'has attributes' do

    expect(@cell.ship).to eq(nil)
  end

  it 'can be empty' do

    expect(@cell.empty?).to be(true)
  end

  it 'can be occupied' do
    cruiser = Ship.new("Cruiser", 3)

    @cell.place_ship(cruiser)
    expect(@cell.empty?).to eq(false)
    expect(@cell.ship).to eq(cruiser)
  end

  describe '#fire_upon and #fired_upon?' do
    it 'defaults non-fired upon...' do
      cell = Cell.new("B4")
      expect(cell.fired_upon?).to eq(false)
    end

    it 'can be fired upon and lower ship health' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

      cell.place_ship(cruiser)

      cell.fire_upon
      expect(cell.fired_upon?).to be(true)
      expect(cell.ship.health).to be(2)
    end
  end

  describe '#render' do
    it 'displays Miss, Hit, X->sunk . fired upon' do
      cell_1 = Cell.new("B4")

      expect(cell_1.render).to eq(".")
    end

    it 'can take a hit and display M' do
      cell_1 = Cell.new("B4")

      cell_1.fire_upon
      expect(cell_1.render).to eq("M")
    end

    it 'can show a ship' do
      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)

      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
      expect(cell_2.render(true)).to eq("S")
    end

    it 'can show a hit' do
      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)

      cell_2.place_ship(cruiser)
      cell_2.fire_upon

      expect(cell_2.render).to eq("H")
    end

    it 'can pull a Titanic and sink' do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)

      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      expect(cruiser.sunk?).to eq(false)
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to eq(true)
      expect(cell_2.render).to eq("X")
    end
  end
end
