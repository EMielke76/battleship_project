class Turn
  attr_reader :player_board,
              :computer_board,
              :computer,
              :player

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @computer = Computer.new(@computer_board)
    @player = Player.new(@player_board)
  end

  def turn_prompt
    puts "*$*"*3 + " Computer Board " + "*$*"*3
    puts @computer.computer_board.render
    puts "-*-"*3 +" Your Board " + "-*-"*3
    puts @player_board.render(true)
    puts "Take your shot! Enter a coordinate you wish to \n" +
    "fire upon!"
  end

  def shot_call
    loop do
    a_shot = gets.chomp.upcase
      if @computer.computer_board.valid_coordinate?(a_shot) == true
        if @computer.computer_board.cells[a_shot].fired_upon? == true
          puts "You've already taken that shot. Please try again"
          redo
        else
        take_shot(a_shot)
        break
      end
      if @computer.computer_board.valid_coordinate?(a_shot) == false
        puts "That coordinate is invalid. Please try again!"
        redo
      end
      end
    end
  end

  def take_shot(shot)
    @computer.computer_board.cells[shot].fire_upon
    if @computer.computer_board.cells[shot].empty? == false
      puts "** Hit on #{shot}! **"
      if @computer.computer_board.cells[shot].ship.sunk? == true
        puts " *$* You made it pull a Titanic! It gone. *$*"
      end
    else
      puts "Miss!"
    end
  end

  def shoot_at_player
    loop do
      shot = @computer.combined_select
      # if player.player_board.valid_coordinate?(shot) == false
      if @player.player_board.cells[shot].fired_upon? == true
        redo
      else @player.player_board.cells[shot].fire_upon
        if @player.player_board.cells[shot].empty? == false
          puts "The computer scored a HIT!"
          if @player.player_board.cells[shot].ship.sunk? == true
            puts "The computer sank your ship. Sorryyyy"
          end
        else @player.player_board.cells[shot].empty? == true
          puts "Woo the computer missed your ship!"
        end
        break
      end
    end
  end
end
