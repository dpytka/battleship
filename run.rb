require './board'
require './game'

board = Board.new
game = Game.new(board)
game.play
