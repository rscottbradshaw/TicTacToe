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
    puts "|1|2|3|"
    puts "|4|5|6|"
    puts "|7|8|9|"
    print "Please select a postion:"
    location = get_user_input.to_i - 1
    if @board.claimed?(location)
      puts "That space is claimed, pick another."
      take_turn
    else
      mark_square(location)
    end
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