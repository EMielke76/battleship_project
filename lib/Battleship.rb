class Battleship
  attr_reader :turn

  def initialize
    @turn = Turn.new
  end


  def greeting
    puts "Welcome to BATTLESHIP\n" +
      "Enter p to play. Enter q to quit."
      answer = gets.chomp
    if answer == 'p'
      puts "Let's play!"
      game_play
    else answer == 'q'
      puts "Okay bye!"
    end
  end

  def game_play
    @turn.computer.place_cruiser
    @turn.computer.place_submarine
    @turn.player.ship_placement
    until winning? do
      @turn.turn_prompt
      @turn.shot_call
      @turn.shoot_at_player
    end

    end_game
  end

  def winning?
    @turn.player.cruiser.sunk? == true && @turn.player.submarine.sunk? == true || @turn.computer.cruiser.sunk? == true && @turn.computer.submarine.sunk? == true
  end

  def end_game
    if @turn.player.cruiser.sunk? == true && @turn.player.submarine.sunk? == true
      puts "The computer won! Play again soon!"
    else @turn.computer.cruiser.sunk? == true && @turn.computer.submarine.sunk? == true
      puts "You won! You now reign as King of the Computers. J/k this is a mod 1 project.. so congrats on that."
    end
  new_game
  end
end

def new_game
  battleship_2 = Battleship.new
  battleship_2.greeting
end
