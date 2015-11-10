class Ship
  attr_accessor :cells, :size

  def initialize(type = :battleship)
    case type
      when :battleship
        @size = 5
      when :destroyer
        @size = 4
    end

    @cells = []
  end

  def sunk?
    @cells.all? {|cell| cell.status == :hit}
  end
end
