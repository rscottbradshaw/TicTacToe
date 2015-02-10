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
      @player1.take_turn
      display
      if game_winner
        puts "#{@player} wins the game!"
      elsif
        @board.full?
        puts "Sorry but we have a draw!  Play again?"
      else
        @player2.take_turn
      end
    end
  end

  def game_over?
    if game_winner || @board.full?
      return true
    end
    false
  end

  def game_winner
    @board.check_row || @board.check_column || @board.check_left_diagonal || @board.check_right_diagonal
  end

end

g = Game.new
