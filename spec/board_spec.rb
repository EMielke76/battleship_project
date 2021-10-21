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

end
