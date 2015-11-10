require './board'
require './game'

board = Board.new

ships = [
    Ship.new(:battleship),
    Ship.new(:destroyer),
    Ship.new(:destroyer)
]
ships.each { |ship|
  board.place_random(ship)
  ship.hit
}

game = Game.new(board)
game.play
