require './Game'
require './Player'
require './Question'
require './Round'

players = Player.new('1'), Player.new('2')
game1 = Game.new players

game1.start