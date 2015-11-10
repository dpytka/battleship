class Cell
  attr_reader :status

  def initialize
    @status = :no_shot
  end

  def hit!
    @status = :hit
  end

  def miss!
    @status = :miss
  end
end
