class Cell
  attr_accessor :ship
  attr_reader :status

  def initialize
    @status = :no_shot
    @ship = nil
  end

  def hit!
    @status = :hit
  end

  def miss!
    @status = :miss
  end
end
