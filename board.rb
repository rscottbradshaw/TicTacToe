class Board
  def initialize
    @squares = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts ""
    puts "|#{@squares[0]}|#{@squares[1]}|#{@squares[2]}|"
    puts "|#{@squares[3]}|#{@squares[4]}|#{@squares[5]}|"
    puts "|#{@squares[6]}|#{@squares[7]}|#{@squares[8]}|"
    puts "--------------------"
  end

  def set_square(i, mark)
    @squares[i] = mark
  end

  def full?
    if @squares.include?(" ")
      return false
    else
      return true
    end
  end

  def claimed?(location)
    if @squares[location] == " "
      return false
    else
      return true
    end
  end

  def check_row
    @squares[0..2].all?  do |str| str  == "X" } #not working
    @squares[0..2].all?  do |str| str  == "O" }
    @squares[3..5].all?  do |str| str  == "X" }
    @squares[3..5].all?  do |str| str  == "O" }
    @squares[6..8].all?  do |str| str  == "X" }
    @squares[6..8].all?  do |str| str  == "O" }
  end

  def check_columns
    @squares[0, 3, 6].all?  do |str| str  == "X" }
    @squares[0, 3, 6].all?  do |str| str  == "O" }
    @squares[1, 4, 7].all?  do |str| str  == "X" }
    @squares[1, 4, 7].all?  do |str| str  == "O" }
    @squares[2, 5, 8].all?  do |str| str  == "X" }
    @squares[2, 5, 8].all?  do |str| str  == "O" }
  end

  def check_left_diagonal
    @squares[0, 4, 8].all?  do |str| str  == "X" }
    @squares[0, 4, 8].all?  do |str| str  == "O" }
  end

  def check_right_diagonal
    @squares[2, 4, 6].all?  do |str| str  == "X" }
    @squares[2, 4, 6].all?  do |str| str  == "O" }
  end

end

# b = Board.new
# b.display
# b.set_square(0, "X")
# b.display
# b.set_square(1, "O")
# b.display
