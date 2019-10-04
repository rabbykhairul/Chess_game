require_relative "./chess_piece.rb"

class Pawn < ChessPiece
    def symbol
        ' ♟ '.colorize(color)
    end
end