require './Game'
require './Player'

players = Player.new(1), Player.new(2)
game1 = Game.new players

# driver
game1.start_game