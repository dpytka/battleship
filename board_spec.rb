require 'minitest/autorun'
require './board'

class Board
  attr_reader :grid
end

describe Board do
  before do
    @board = Board.new
  end

  it "does not place overlapping ships" do
    ships = [
        Ship.new(:battleship),
        Ship.new(:battleship),
        Ship.new(:battleship)
    ]
    ships.each { |ship| @board.place_random(ship) }

    ships.flat_map { |ship| ship.cells }.uniq.size.must_equal 15
  end

  it "finish status when all ship are hit" do
    ships = [
        Ship.new(:battleship),
        Ship.new(:battleship),
        Ship.new(:battleship)
    ]
    ships.each { |ship| @board.place_random(ship) }
    ships.flat_map { |ship| ship.cells }.each {|cell| cell.hit!}

    @board.finished?.must_equal true
  end

  it "miss status when missed" do
    @board.check('B', 1).must_equal :miss
  end

  it "hit status when missed" do
    ship = Ship.new(:battleship)
    @board.place_random(ship)
    x_y = find_cell_cordinates(ship.cells.first)
    @board.check(x_y.first, x_y.last).must_equal :hit
  end

  it "sunk status when missed" do
    ship = Ship.new(:battleship)
    @board.place_random(ship)
    ship.cells[1..-1].each {|cell| cell.hit!}
    x_y = find_cell_cordinates(ship.cells.first)
    @board.check(x_y.first, x_y.last).must_equal :sunk
  end

  it "determine overlaping cells" do
    ship = Ship.new(:battleship)
    @board.place_random(ship)
    @board.overlap(ship.cells).must_equal true
  end

  private
  def find_cell_cordinates(cell)
    @board.grid.each_with_index do |row, i|
      row.each_with_index { |col, y| return [Board::ROW[i], y+1] if col == cell }
    end
  end
end
