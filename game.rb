require './board'
require './player'

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new(@board, "X")
    @player2 = Player.new(@board, "O")

    game_play
  end

  def display
    @board.display
  end

  def game_play
    while game_over? == false do
      display
      if game_winner #not sure about this either
        puts "#{@player} wins the game!"
      elsif
      @player1.take_turn
      display
      elsif game_over?
        puts "Thanks for playing, you suck!!"
      else
        @player2.take_turn
      end
    end
  end

  def game_over?
    if @board.full?
      return true
    end
    false
  end

  def game_winner
    @check_row || @check_column || @check_left_diagonal || @check_right_diagonal
  end

end

g = Game.new
