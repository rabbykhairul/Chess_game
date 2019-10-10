require_relative "./chess_piece.rb"

class Pawn < ChessPiece
    def initialize(color, position, board)
        super
        @start_position = position
        @move_direction = @color == :black ? [1,0] : [-1,0]
    end

    def symbol
        ' ♟ '.colorize(color)
    end
end 