require './board.rb'

class Computer
  def initialize(board)
    @board = board
  end

  def take_turn
    available_squares = @board.available_squares
    @board.set_square(available_squares.sample, "O")
  end
end
