require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'

describe 'Computer' do
  it 'exists' do
    computer = Computer.new

    expect(computer).to be_a(Computer)
  end
end
