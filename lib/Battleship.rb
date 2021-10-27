class Battleship


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

  def game_play(computer, player)
    computer.place_cruiser
    computer.place_submarine
    player.ship_placement
  end

  
end
