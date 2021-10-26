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
      end
    end
  
