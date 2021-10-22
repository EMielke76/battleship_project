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
  end

end
