require_relative "./chess_piece.rb"

class Queen < ChessPiece
    def symbol
        ' ♛ '.colorize(color)
    end
end