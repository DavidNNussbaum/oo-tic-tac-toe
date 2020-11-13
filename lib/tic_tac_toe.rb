class TicTacToe
    def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
  
    WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  
    def input_to_index(user_input)
      user_input.to_i - 1
    end
  
    def move(index, token)
      @board[index] = token
    end
  
    def position_taken?(index)
      @board[index] != " "
    end
  
    def valid_move?(index)
      !position_taken?(index) && index.between?(0,8)
    end
  
    def turn_count
      @board.count{|square| square != " " }
    end
  
    def current_player
      turn_count.even? ? "X" : "O"
    end
  
    def turn
      puts "Please enter a number (1-9):"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
        token = current_player
        move(index, token)
      else
        turn
      end
      display_board
    end
  
    def won?
      WIN_COMBINATIONS.any? do |combo|
        if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
          return combo
        end
      end
    end
  
    def full?
      @board.all?{|square| square != " " }
    end
  
    def draw?
      full? && !won?
    end
  
    def over?
      won? || draw?
    end
  
    def winner
      if combo = won?
        @board[combo[0]]
      end
    end
  
    def play
      turn until over?
      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
  end 


# class TicTacToe

#     WIN_COMBINATIONS = [
#         [0,1,2], # Top row
#         [3,4,5],  # Middle row
#         [6,7,8],
#         [0,3,6],
#         [1,4,7],
#         [2,5,8],
#         [0,4,8],
#         [2,4,6]
# ]
#     def initialize
#         @board = board || Array.new(9, " ")
#     end

#     def self.display_board
#         puts @board
#     end

#     def self.input_to_index(input)
#         @index = input.to_i - 1
#     end

#     def self.move(input, token = "X")
#         @index = index
#         @token = token
#     end

#     def self.position_taken?
#         if @board[index] == ""
#             false
#         else
#             true
#         end
#     end

#     def self.valid_move?
#         if [1..9].include?(input) && self.positon_taken == false
#             true
#         else
#             false
#         end
#     end

#     def self.turn
#         puts "Choose a number from 1-9"
#         input = gets
#         input = input.chomp
#         @index = self.class.input_to_index
#         if self.class.valid_move?
#             self.class.move
#             self.class.display_board
#         else
#             self.class.turn
#         end
#     end

#     def self.turn_count
#         9 - @board.count("")
#     end

#     def self.current_player
#         turn_count % 2 == 0 ? "X" : "O"
#     end

#     def self.won?
#         if WIN_COMBINATIONS.include?(@board.delete(""))
#             return @board.delete("")
#         else
#             false
#         end
#     end

#     def self.full?
#         if @board == @board.delete("")
#             true
#         else
#             false
#         end
#     end

#     def self.draw?
#         if @board == @board.delete("") && self.class.won? == false
#             true
#         elsif self.class.won? == true
#             false
#         else
#             false
#     end

#     def self.over?
#         if self.class.won? == true || self.class.ful == true
#             true
#         else
#             false
#         end 
#     end

#     def self.winner
#         if self.won == true && WIN_COMBINATIONS.include?("X")
#             return "X"
#         else
#             return "O"
#         end
#     end

#     def play
#         if self.over? == false
#             self.turn
#         elsif self.won? == true
#             return "Congradulations #{self.winner}!"
#         else
#             return "This game ended in a draw."
#         end
#     end


# end