require_relative './board.rb'

class Display
    attr_reader :chess_board
    
    def initialize(chess_board)
        @chess_board = chess_board
    end
end