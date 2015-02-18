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
    sides = [1, 3, 5, 7]
    best_available = available_squares - sides

    player_win = near_win(player_moves, available_squares)
    computer_win = near_win(@board.computer_moves, available_squares)

    return computer_win if computer_win
    return player_win if player_win

    try_to_win = go_for_win(computer_moves, available_squares, player_moves)
    return try_to_win if try_to_win
    
    return 4 if available_squares.include?(4)

    return best_available.sample unless best_available.empty?
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

  def go_for_win(computer_moves, available, player_moves)
    less_available = available
    less_available.each do |i|
      winner = near_win(computer_moves + [i], available - [i])
      return i if winner && !player_trap(player_moves + [winner], available - [i])
    end
    false
  end

  def player_trap(player_moves, available)
    first = near_win(player_moves, available)
    return true if first && near_win(player_moves, available - [first])
    false
  end
end
