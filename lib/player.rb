class Player

  attr_reader :board

  def initialize(board)
    @board = board
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
  end

  def ship_placement
    puts "I have laid out my ships on the grid\n" +
      "You now need to lay out your two ships.\n" +
      "The Cruiser is three units long and the \n" +
      "Submarine is two units long."
    puts @board.render
    puts "Enter the squares for the Cruiser one at a time, \n" +
    "for a total of 3 spaces:"

    loop do
      cruiser_coordinates = []
      @cruiser.length.times do
        cruiser_coordinates << gets.chomp
      end

      cruiser_coordinates.sort
      if @board.valid_placement?(@cruiser, cruiser_coordinates) == false
        puts "Those coordinates are invalid. Please try again!"
      end
      if @board.valid_placement?(@cruiser, cruiser_coordinates) == true
        @board.place(@cruiser, cruiser_coordinates)
        break
      end
    end
    puts "Now let's place the Submarine.\n" +
    "It has 2 cells. Please enter them one at a time."
    puts @board.render(true)

    loop do
      submarine_coordinates = []
      @submarine.length.times do
        submarine_coordinates << gets.chomp
      end

      submarine_coordinates.sort
      if @board.valid_placement?(@submarine, submarine_coordinates) == false
        puts "Those coordinates are invalid. Please try again!"
      end
      if @board.valid_placement?(@submarine, submarine_coordinates) == true
        @board.place(@submarine, submarine_coordinates)
        break
      end
    end
    puts @board.render(true)
  end
end
