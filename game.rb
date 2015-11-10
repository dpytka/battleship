class Game
  def initialize(board)
    @board = board
  end

  def play
    print @board.to_grid_s

    round  = 0
    loop do
      round += 1
      print 'Enter coordinates (row, col), e.g. A5 = '

      input = gets.chomp.strip.upcase
      if input == 'SHOW'
        print @board.to_grid_s(:show)
        next
      end

      message = ''
      if input_valid?(input)
        x, y = [input[0], input[1..-1]]
        status = @board.check(x, y)
        message << "Miss\n" if status == :miss
        message << "Sunk\n" if status == :sunk
      end

      message << @board.to_grid_s
      print message

      if @board.finished?
        print "Well done! You completed the game in #{round} shots\n"
        break
      end
    end

  end

  def input_valid?(input)
    input =~ /^[A-J]([1-9]|10)$/
  end
end
