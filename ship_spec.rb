require 'minitest/autorun'
require './ship'
require './cell'

describe Ship do
  before do
    @ship = Ship.new
  end

  it "can determine not sunk ship" do
    @ship.cells = [Cell.new, Cell.new]
    @ship.sunk?.must_equal false
  end

  it "can determine sunk ship" do
    @ship.cells = [Cell.new, Cell.new]
    @ship.cells.each {|cell| cell.hit!}
    @ship.sunk?.must_equal true
  end
end
