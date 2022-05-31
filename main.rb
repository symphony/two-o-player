require './Game'
require './Player'
require './Question'

players = Player.new('1'), Player.new('2')
game1 = Game.new

game1.start_game players