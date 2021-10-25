require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/Battleship'

RSpec.describe 'Battleship game' do
  it 'exists' do
    battleship = Battleship.new

    expect(battleship).to be_a(Battleship)
  end
end
