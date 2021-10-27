require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/Battleship'
require './lib/player'
require './lib/computer'
require './lib/turn'


RSpec.describe 'Battleship game' do
  it 'exists' do
    battleship = Battleship.new

    expect(battleship).to be_a(Battleship)
  end

  it 'initializes a turn' do
    battleship = Battleship.new

    expect(battleship.turn).to be_a(Turn)
  end
end
