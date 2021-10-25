require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'
require './lib/computer'

describe 'Computer' do
  it 'exists' do
    board = Board.new
    computer = Computer.new(board)

    expect(computer).to be_a(Computer)
  end
end

describe '#place_ship' do
  it 'can generate random letters' do
    board = Board.new
    computer = Computer.new(board)

    computer.letter_select

    expect(computer.letter_select).to be_a(String)
  end

  it 'can generate a random number' do
    board = Board.new
    computer = Computer.new(board)

    expect(computer.number_select).to be_a(String)
  end

  it 'can combine random pick into a single string' do
  board = Board.new
  computer = Computer.new(board)

  expect(computer.combined_select).to be_a(String)
  end

  it 'can validate a combined_selection' do
    board = Board.new
    computer = Computer.new(board)
    combined_selection = "A4"
    expect(computer.board.valid_coordinate?(combined_selection)).to eq(true)
    combined_2 = "F5"
    expect(computer.board.valid_coordinate?(combined_2)).to eq(false)
  end
end

describe '#place_cruiser' do
  it 'can create coordinates for a cruiser' do
    board = Board.new
    computer = Computer.new(board)

    expect(computer.cruiser_coordinates).to be_a(Array)
    expect(computer.cruiser_coordinates.length).to eq(3)
  end
end

describe '#submarine' do
  it 'can create coordinates for a submarine' do
    board = Board.new
    computer = Computer.new(board)

    expect(computer.submarine_coordinates).to be_a(Array)
    expect(computer.submarine_coordinates.length).to eq(2)
  end
end
