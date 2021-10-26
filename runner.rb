require './lib/Battleship'
require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'
require './lib/computer'

battleship = Battleship.new
# battleship.greeting

player_board = Board.new
computer_board = Board.new
computer = Computer.new(computer_board)
player = Player.new(player_board)
#require "pry"; binding.pry

player.ship_placement
player.shoot_at(computer)

computer.shoot_at(player)
