require './cell'
require './ship'

class Board
  ROW = ('A'..'J').to_a
  COL = (1..10).to_a
  DIM = 10

  def initialize
    @grid = Array.new(DIM) { Array.new(DIM) { Cell.new } }

    @ships = [
        Ship.new(:battleship),
        Ship.new(:destroyer),
        Ship.new(:destroyer)
    ]
    @ships.each { |ship|
      place_random(ship)
      ship.hit
    }
  end

  def place_random(ship)
    orient = [:vert, :hor][rand(2)]

    if orient == :hor
      start_x = rand(Board::DIM)
      start_y = rand(Board::DIM - ship.size)
      ship.cells = @grid[start_x][start_y..start_y + ship.size]
    else
      start_x = rand(Board::DIM - ship.size)
      start_y = rand(Board::DIM)
      ship.cells = @grid.transpose[start_y][start_x..start_x + ship.size]
    end

    p "#{start_x},#{start_y} #{orient}"
  end

  def draw
    print "  #{COL.join(' ')}\n"
    @grid.each_with_index { |row, index|
      print "#{ROW[index]} #{row.join(' ')}\n"
    }
  end
end
