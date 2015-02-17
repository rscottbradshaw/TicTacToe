require './board'
require './player'
require './computer'

class Game
  def initialize
    @board = Board.new
    @player = Player.new(@board)
    @computer = Computer.new(@board)

    game_play
  end

  def display
    @board.display
  end

  def game_play
    puts " "
    print "****** Welcome to Tic Tac Toe. Think you can beat the computer? Give it your best shot! ******"
    puts " "
    while game_over? == false do
      display
      @player.take_turn
      return end_message if game_over?
      display
      @computer.take_turn
    end
    end_message
  end

  def game_over?
    if game_winner || @board.full?
      return true
    end
    false
  end

  def end_message
    if game_winner
      display
      puts "#{game_winner} wins the game!  Play again?"
    elsif
      @board.full?
      puts "Sorry but we have a draw!  Play again?"
    end
  end

  def game_winner
    return "Computer" if @board.check_win(@board.computer_moves)
    return "Player" if @board.check_win(@board.player_moves)
    false
  end

end

g = Game.new
