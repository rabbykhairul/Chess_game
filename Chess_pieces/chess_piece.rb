require 'colorize'

class ChessPiece
    attr_reader :color, :board
    attr_accessor :position
    
    def initialize(color, position, board)
        @color = color
        @position = position
        @board = board
    end

    def within_range?(row, col)
        row.between?(0,7) && col.between?(0,7)
    end
end