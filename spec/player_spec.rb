require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'

describe 'Player' do
  it 'exists' do
    board = Board.new
    player = Player.new(board)

    expect(player).to be_a(Player)
  end

  # it 'can place a ship' do
  #   board = Board.new
  #   ship = Ship.new('cruiser', 3)
  #   player = Player.new(board)
  #   player.ship_placement
  #
  #   expect(board.cells.empty?).to eq(false)
  # end
end
