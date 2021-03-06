
class Computer

  attr_accessor :computer_board, :cruiser, :submarine

  def initialize(board)
    @computer_board = board
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
  end

  def letter_select
    letter = ("A".."D").to_a
    letter.sample
  end

  def number_select
    number = ("1".."4").to_a
    number.sample
  end

  def combined_select
    letter_select + number_select
  end

  def place_cruiser
    loop do
      cruiser_coordinates = []
      @cruiser.length.times do
        cruiser_coordinates << combined_select
      end
      cruiser_coordinates.sort
      if @computer_board.valid_placement?(@cruiser, cruiser_coordinates) == true
        @computer_board.place(@cruiser, cruiser_coordinates)
        break
      end
    end
  end



  def place_submarine
    loop do
      submarine_coordinates = []
      @submarine.length.times do
        submarine_coordinates << combined_select
      end
      submarine_coordinates.sort
      if @computer_board.valid_placement?(@submarine, submarine_coordinates) == true
        @computer_board.place(@submarine, submarine_coordinates)
        break
      end
    end
  end
end
