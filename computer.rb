require './board.rb'

class Computer
  def initialize(board)
    @board = board
  end

  def take_turn
    turn = game_logic
    @board.computer_moves << turn
    @board.set_square(turn, "O")
  end

  def game_logic
    available_squares = @board.available_squares
    player_moves = @board.player_moves
    computer_moves = @board.computer_moves

    player_win = near_win(player_moves, available_squares)
    computer_win = near_win(@board.computer_moves, available_squares)

    return computer_win if computer_win
    return player_win if player_win

    return go_for_win(computer_moves, available_squares) if computer_moves.length == 1

    return 4 if available_squares.include?(4)

    sides = [1, 3, 5, 7]
    best_available = available_squares - sides
    best_available.sample unless best_available.empty?
    available_squares.sample
  end

  def near_win(made_moves, available)
    if made_moves.length >= 2
      available.each do |i|
        scenario = made_moves + [i]
        return i if @board.check_win(scenario)
      end
    end
    false
  end

  def go_for_win(moves, available)
    less_available = available - [0]
    less_available.each do |i|
      return i if near_win(moves + [i], available)
    end
  end
end
