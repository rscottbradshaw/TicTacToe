require './board.rb'

class Player
  def initialize(board, mark)
    @board = board
    @mark = mark
  end

  def mark_square(i)
    @board.set_square(i, @mark)
  end

  def get_user_input
    gets.chomp
  end

  def take_turn
    # print "X or O:"
    # mark = get_user_input
    puts "|1|2|3|"
    puts "|4|5|6|"
    puts "|7|8|9|"
    print "location:"
    location = get_user_input.to_i - 1
    mark_square(location)
  end



end

# b = Board.new
# p1 = Player.new(b, "x")
# p2 = Player.new(b, "o")
#
# b.display
# p1.take_turn
# b.display
# p2.take_turn
#
#
# b.display
