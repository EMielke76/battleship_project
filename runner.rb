require './lib/Battleship'
require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'

battleship = Battleship.new
# battleship.greeting

board = Board.new
player = Player.new(board)

player.ship_placement
