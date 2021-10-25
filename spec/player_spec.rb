require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'

describe 'Player' do
  it 'exists' do
    player = Player.new

    expect(player).to be_a(Player)
  end
end
