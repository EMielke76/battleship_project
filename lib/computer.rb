class Computer

  attr_reader :board, :cruiser, :submarine

  def initialize(board)
    @board = board
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
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

  def cruiser_coordinates
    cruiser_coordinates = []
    until cruiser_coordinates.length == 3 do
      combined_select
      if @board.valid_coordinate?(combined_select)
        cruiser_coordinates << combined_select
      end
    end
    return cruiser_coordinates
  end

  def submarine_coordinates
    submarine_coordinates = []
    submarine_coordinates.length == 2 && submarine_coordinates.valid_placement(ship, coordinates) do
      combined_select
      if @board.valid_coordinate?(combined_select)
        submarine_coordinates << combined_select
      end
    end
    return submarine_coordinates
  end

  def place_ship(ship, coordinates)
    if @board.valid_placement?(ship, coordinates) == false

    else @board.valid_placement?(ship, coordinates) == true
        @board.place(ship, coordinates)



  end
end
