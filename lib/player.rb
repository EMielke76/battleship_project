require './lib/computer'

class Player

  attr_accessor :player_board

  def initialize(board)
    @player_board = board
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
  end

  def ship_placement
    puts "I have laid out my ships on the grid\n" +
      "You now need to lay out your two ships.\n" +
      "The Cruiser is three units long and the \n" +
      "Submarine is two units long."
    puts @player_board.render
    puts "Enter the squares for the Cruiser one at a time, \n" +
    "for a total of 3 spaces:"

    loop do
      cruiser_coordinates = []
      @cruiser.length.times do
        cruiser_coordinates << gets.chomp.upcase
      end

      cruiser_coordinates.sort
      if @player_board.valid_placement?(@cruiser, cruiser_coordinates) == false
        puts "Those coordinates are invalid. Please try again!"
      end
      if @player_board.valid_placement?(@cruiser, cruiser_coordinates) == true
        @player_board.place(@cruiser, cruiser_coordinates)
        break
      end
    end
    puts "Now let's place the Submarine.\n" +
    "It has 2 cells. Please enter them one at a time."
    puts @player_board.render(true)

    loop do
      submarine_coordinates = []
      @submarine.length.times do
        submarine_coordinates << gets.chomp.upcase
      end

      submarine_coordinates.sort
      if @player_board.valid_placement?(@submarine, submarine_coordinates) == false
        puts "Those coordinates are invalid. Please try again!"
      end
      if @player_board.valid_placement?(@submarine, submarine_coordinates) == true
        @player_board.place(@submarine, submarine_coordinates)
        break
      end
    end
    puts "Here is your board"
    `say "Lets play!"`
    puts @player_board.render(true)
  end

  def shoot_at(computer)
    puts "-*-"*3 + " Computer Board " + "-*-"*3
    puts computer.computer_board.render
    puts "-*-"*3 +" Your Board " + "-*-"*3
    puts @player_board.render(true)
    puts "Take your shot! Enter a coordinate you wish to \n" +
    "fire upon!"
    shot = gets.chomp.upcase
    loop do
      if computer.computer_board.valid_coordinate?(shot) == false
        puts "That coordinate is invalid. Please try again!"
      end
      if computer.computer_board.cells[shot].fired_upon? == true
        puts "You've already taken that shot. Please try again"
      end
      if computer.computer_board.valid_coordinate?(shot) == true
        computer.computer_board.cells[shot].fire_upon
        break
      end
    end
    if computer.computer_board.cells[shot].empty? == false
      puts "Hit!"
    else
      puts "Miss!"
    end
    puts computer.computer_board.render
    puts @player_board.render(true)
  end
end
