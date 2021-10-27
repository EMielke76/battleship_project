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

  it 'has ships' do
    board = Board.new
    computer = Computer.new(board)

    expect(computer.cruiser).to be_a(Ship)
    expect(computer.submarine).to be_a(Ship)
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

    expect(computer.combined_select.length).to eq(2)
    expect(computer.combined_select).to be_a(String)
  end

  it 'can validate a combined_selection' do
    board = Board.new
    computer = Computer.new(board)
    combined_selection = "A4"
    expect(computer.computer_board.valid_coordinate?(combined_selection)).to eq(true)
    combined_2 = "F5"
    expect(computer.computer_board.valid_coordinate?(combined_2)).to eq(false)
  end

  describe '#place_ship' do
    it 'places a cruiser if successful coordinates generated' do
      board = Board.new
      computer = Computer.new(board)
      computer.place_cruiser
      expect(board.cells.empty?).to eq(false)
    end

    it 'places a submarine if successful coordinates generated' do
      board = Board.new
      computer = Computer.new(board)
      computer.place_submarine
      expect(board.cells.empty?).to eq(false)
    end
  end
end
