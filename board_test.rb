# TEST
# display an empty board
# display X in first sqaure
# display O in second square
# display X and O at same time

require 'minitest/autorun'
require 'minitest/pride'
require './board.rb'

class BoardTest < Minitest::Test
  def test_display_an_empty_board
    board = Board.new
    assert_output(empty_board) do
      board.display
    end
  end

  def test_display_x_in_first_square
    board = Board.new
    board.set_square(0, "x")
    assert_output(x_in_first_square) do
      board.display
    end
  end

  def test_display_o_in_second_square
    board = Board.new
    board.set_square(1, "o")
    assert_output(o_in_second_square) do
      board.display
    end
  end

  def test_display_x_and_o_at_same_time
    board = Board.new
    board.set_square(0, "x")
    board.set_square(1, "o")
    assert_output(x_and_o_at_same_time) do
      board.display
    end
  end

  def empty_board
    %Q{
| | | |
| | | |
| | | |
}
  end

  def x_in_first_square
    %Q{
|x| | |
| | | |
| | | |
}
  end

  def o_in_second_square
    %Q{
| |o| |
| | | |
| | | |
}
  end

  def x_and_o_at_same_time
    %Q{
|x|o| |
| | | |
| | | |
}
  end

end

# def test_game_is_not_over
#   board = Board.new
#   board.set_square(0, "x")
#   assert_equal false, board.game_over?
# end
