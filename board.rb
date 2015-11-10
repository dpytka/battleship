require './cell'
require './ship'

class Board
  ROW = ('A'..'J').to_a
  COL = (1..10).to_a
  DIM = 10

  def initialize
    @grid = Array.new(DIM) {Array.new(DIM) {Cell.new}}

    ship1 = Ship.new(:battleship)
    ship1.place(@grid)
    ship1.hit

    ship2 = Ship.new(:destroyer)
    ship2.place(@grid)
    ship2.hit
    ship3 = Ship.new(:destroyer)
    ship3.place(@grid)
    ship3.hit

  end

  def draw
    print "  #{COL.join(' ')}\n"
    @grid.each_with_index {|row, index|
      print "#{ROW[index]} #{row.join(' ')}\n"
    }
  end
end
