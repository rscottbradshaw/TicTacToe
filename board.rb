class Board
  def initialize
    @squares = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts ""
    puts "|#{@squares[0]}|#{@squares[1]}|#{@squares[2]}|"
    puts "|#{@squares[3]}|#{@squares[4]}|#{@squares[5]}|"
    puts "|#{@squares[6]}|#{@squares[7]}|#{@squares[8]}|"
  end

  def set_square(i, mark)
    @squares[i] = mark
  end

end

# b = Board.new
# b.display
# b.set_square(0, "X")
# b.display
# b.set_square(1, "O")
# b.display
