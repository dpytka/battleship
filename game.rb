class Game
  def initialize(board)
    @board = board
  end

  def play
    print @board.to_grid_s

    loop do

      print 'Enter coordinates (row, col), e.g. A5 = '

      input = gets.chomp.strip.downcase
      if input == 'show'
        print @board.to_grid_s(:show)
        next
      end

      p input_valid?(input) ? 'valid' : 'invalid'

      if input_valid?(input)

      end


      print @board.to_grid_s
      if @board.finished?
        print "Well done! You completed the game in 14 shots\n"
        break
      end
    end

  end

  def input_valid?(input)
    input =~ /^[a-j]([1-9]|10)$/
  end
end
