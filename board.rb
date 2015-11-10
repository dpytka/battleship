require './cell'
require './ship'

class Board
  ROW = ('A'..'J').to_a
  COL = (1..10).to_a
  DIM = 10

  def initialize
    @grid = Array.new(DIM) { Array.new(DIM) { Cell.new } }
    @ships = []
  end

  def place_random(ship)
    loop do
      orient = [:vert, :hor].sample
      if orient == :hor
        start_x = rand(DIM)
        start_y = rand(DIM - ship.size)
        cells = @grid[start_x][start_y...start_y + ship.size]
      else
        start_x = rand(DIM - ship.size)
        start_y = rand(DIM)
        cells = @grid.transpose[start_y][start_x...start_x + ship.size]
      end

      next if overlap(cells)
      ship.cells = cells
      break
    end
    @ships << ship
  end

  def overlap(cells)
    (@ships.flat_map(&:cells) & cells).any?
  end

  def check(x, y)
    cell = @grid[ROW.index(x)][y.to_i - 1]
    hit_ship = cell_ship(cell)

    if hit_ship
      cell.hit!

      if hit_ship.sunk?
        :sunk
      else
        :hit
      end
    else
      cell.miss!
      :miss
    end
  end

  def cell_ship(cell)
    ship = @ships.select {|ship| ship.cells.include?(cell)}
    ship.empty? ? nil : ship[0]
  end

  def finished?
    @ships.all?(&:sunk?)
  end

  def to_grid_s(mode = :game)
    board = "  #{COL.join(' ')}\n"
    @grid.each_with_index { |row, index|
      board << "#{ROW[index]} "
      board << row.collect do |cell|
        if mode == :show
          cell_ship(cell) ? 'x' : ' '
        elsif cell.status == :hit
          'x'
        elsif cell.status == :miss
          '-'
        else
          '.'
        end
      end.join(' ')
      board << "\n"
    }
    board
  end
end
