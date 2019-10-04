require_relative "./chess_piece.rb"

class King < ChessPiece
    def symbol
        '♚'.colorize(color)
    end
end