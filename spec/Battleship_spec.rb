require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/Battleship'
require './lib/player'
require './lib/computer'


RSpec.describe 'Battleship game' do
  it 'exists' do
    battleship = Battleship.new

    expect(battleship).to be_a(Battleship)
  end

  # it 'displays main menu' do
  #   battleship = Battleship.new
  #
  #   expect(battleship.greeting).to
  # end
end
