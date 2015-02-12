class Board
  attr_accessor :player_moves
  attr_accessor :computer_moves

  def initialize
    @squares = [" "," "," "," "," "," "," "," "," "]
    @player_moves = []
    @computer_moves = []
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

  def available_squares
    available = @squares.each_with_index.select { |square, loc| square == " " }
    available.map { |sq| sq[1] }
  end

  def check_row
    @squares[0..2].all? { |str| str  == "X" } ||
    @squares[0..2].all? { |str| str  == "O" } ||
    @squares[3..5].all? { |str| str  == "X" } ||
    @squares[3..5].all? { |str| str  == "O" } ||
    @squares[6..8].all? { |str| str  == "X" } ||
    @squares[6..8].all? { |str| str  == "O" }
  end

  def check_column
    @squares.values_at(0, 3, 6).all? { |str| str  == "X" } ||
    @squares.values_at(0, 3, 6).all? { |str| str  == "O" } ||
    @squares.values_at(1, 4, 7).all? { |str| str  == "X" } ||
    @squares.values_at(1, 4, 7).all? { |str| str  == "O" } ||
    @squares.values_at(2, 5, 8).all? { |str| str  == "X" } ||
    @squares.values_at(2, 5, 8).all? { |str| str  == "O" }
  end

  def check_left_diagonal
    @squares.values_at(0, 4, 8).all? { |str| str  == "X" } ||
    @squares.values_at(0, 4, 8).all? { |str| str  == "O" }
  end

  def check_right_diagonal
    @squares.values_at(2, 4, 6).all? { |str| str  == "X" } ||
    @squares.values_at(2, 4, 6).all? { |str| str  == "O" }
  end

  def check_win(values)
    win_conditions = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    win_conditions.each do |wc|
      a = wc - values
      return values if a.empty?
    end
    false
  end

end

# b = Board.new
# b.display
# b.set_square(0, "X")
# b.display
# b.set_square(1, "O")
# b.display
