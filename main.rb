require './Game'
require './Player'

game1 = Game.new
players = Player.new('1'), Player.new('2')

game1.start_game players