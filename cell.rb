class Cell
  def initialize
    @status = :no_shot
  end

  def hit!
    @status = :hit
  end

  def miss!
    @status = :miss
  end

  def to_s
    case @status
      when :no_shot
        '.'
      when :hit
        'x'
      when :miss
        '-'
      else
        raise
    end
  end
end
