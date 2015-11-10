class Ship
  def initialize(type)
    case type
      when :battleship
        @size = 5
      when :destroyer
        @size = 4
      else
        raise
    end
  end

  def place(grid)
    orientation = [:vert, :hor][rand(2)]

    case orientation
      when :hor
        start_x = rand(Board::DIM); start_y = rand(Board::DIM - @size)
        @cells = grid[start_x][start_y..(start_y)+@size]
      when :vert
        start_x = rand(Board::DIM - @size); start_y = rand(Board::DIM)
        @cells = grid.map {|a| a[start_y]}[start_x..(start_x)+@size]
      else
        raise
    end

    p "#{start_x},#{start_y} #{orientation}"
  end

  def hit
    @cells.each {|cell| cell.hit!}
  end
end
