require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'
require './lib/computer'
require './lib/turn'

describe 'Turn class' do
  it 'exists' do
    turn = Turn.new

    expect(turn).to be_a(Turn)
  end

  it 'has stuff' do
    turn = Turn.new

    expect(turn.player_board).to be_a(Board)
    expect(turn.computer_board).to be_a(Board)
    expect(turn.computer).to be_a(Computer)
    expect(turn.player).to be_a(Player)
  end
end
