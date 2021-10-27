require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe 'board' do
  describe 'Board class' do

    it 'exists' do
      board = Board.new

      expect(board).to be_a(Board)
    end

    it 'has 16 cells' do
      board = Board.new

      expect(board.cells).to be_a(Hash)
      expect(board.cells.length).to eq(16)
      expect(board.cells["A1"]).to be_a(Cell)
    end
  end

  describe '#valid_coordinate' do
    it 'validates coordinates' do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?('D4')).to eq(true)
      expect(board.valid_coordinate?('E1')).to eq(false)
      expect(board.valid_coordinate?('A22')).to eq(false)
    end
  end

  describe '#valid_placement?' do
    it 'can validate placement' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'can actually validate placement' do

      board = Board.new
      submarine = Ship.new("Submarine", 2)
      cruiser = Ship.new("Cruiser", 3)

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end

    it 'can be consecutive cells' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

    it 'cant be placed diagonally' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end
  end

  describe '#place' do
    it 'places a ship on the board' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      require "pry"; binding.pry
      expect(cell_1.ship).to eq(cruiser)
      expect(cell_2.ship).to eq(cruiser)
      expect(cell_3.ship).to eq(cell_2.ship)
    end
  end

  describe '#valid_placement for overlapping ships' do
    it 'can tell when a cell is already occupied' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      submarine = Ship.new("Submarine", 2)


      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    end
  end

  describe '#render' do
    it 'renders a visual representation of the board' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
end
