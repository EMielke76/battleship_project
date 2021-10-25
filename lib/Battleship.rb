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
end
