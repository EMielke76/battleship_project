class Computer

  attr_reader :board

  def initialize(board)
    @board = board
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

end
