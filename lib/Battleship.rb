class Battleship


  def greeting(computer, player)
    puts "Welcome to BATTLESHIP\n" +
      "Enter p to play. Enter q to quit."
      answer = gets.chomp
    if answer == 'p'
      puts "Let's play!"
      game_play(computer, player)
    else answer == 'q'
      puts "Okay bye!"
    end
  end

  def game_play(computer, player)
    computer.place_cruiser
    computer.place_submarine
    player.ship_placement
    until winning?(computer, player) do
      player.shoot_at(computer)
      computer.shoot_at(player)
    end

    end_game(computer, player)
  end

  def winning?(computer, player)
    player.cruiser.sunk? == true && player.submarine.sunk? == true || computer.cruiser.sunk? == true && computer.submarine.sunk? == true
  end

  def end_game(computer, player)
    if player.cruiser.sunk? == true && player.submarine.sunk? == true
      puts "The computer won! Play again soon!"
    else computer.cruiser.sunk? == true && computer.submarine.sunk? == true
      puts "You won! You now reign as King of the Computers. J/k this is a mod 1 project.. so congrats on that."
    end
  greeting(computer, player)
  end
end
