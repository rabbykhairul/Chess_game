require_relative "./chess_piece.rb"

class Rook < ChessPiece
    def symbol
        '♜'.colorize(color)
    end
end