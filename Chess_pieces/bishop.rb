require_relative "./chess_piece.rb"

class Bishop < ChessPiece
    def symbol
        '♝'.colorize(color)
    end
end