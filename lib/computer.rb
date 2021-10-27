
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
      #require "pry"; binding.pry
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
      #require "pry"; binding.pry
      submarine_coordinates.sort
      if @computer_board.valid_placement?(@submarine, submarine_coordinates) == true
        @computer_board.place(@submarine, submarine_coordinates)
        break
      end
    end
  end



  def shoot_at(player)
    loop do
      shot = combined_select
      # if player.player_board.valid_coordinate?(shot) == false
      if player.player_board.cells[shot].fired_upon? == true
        redo
      else player.player_board.cells[shot].fire_upon
        if player.player_board.cells[shot].empty? == false
          puts "The computer scored a HIT!"
        end 
        break
      end
    end
  end
end
