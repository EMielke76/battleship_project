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

  it 'has ships' do
    board = Board.new
    player = Player.new(board)

    expect(player.cruiser).to be_a(Ship)
    expect(player.submarine).to be_a(Ship)
  end
end
