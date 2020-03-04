require 'pry'

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    !self.position_taken?(index) && index.to_s.match(/[0-8]/)
  end

  def turn_count
    @board.count{|t| t == "X" || t == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    loop do
      input = gets
      idx = input_to_index(input)
      if valid_move?(idx)
        move(idx, current_player)
        break
      else
        "invalid"
      end
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
    end
    return false
  end

  def full?
    @board.count{|t| t == "X" || t == "O"} == 9
  end

  def draw?
    self.full? && !self.won?
  end

  def over?
    self.draw? || self.won?
  end

  def winner
    if over? && won?
      return current_player == "X" ? "O" : "X"
    else
      binding.pry
      return nil
    end
  end
end
