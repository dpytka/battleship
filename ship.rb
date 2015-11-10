class Ship
  attr_accessor :cells, :size

  def initialize(type)
    case type
      when :battleship
        @size = 5
      when :destroyer
        @size = 4
      else
        raise
    end

    @cells = []
  end

  def hit
    @cells.each {|cell| cell.hit!}
  end

  def sunk?
    @cells.all? {|cell| cell.status == :hit}
  end
end
