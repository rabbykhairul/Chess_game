require_relative "./chess_piece.rb"

class Knight < ChessPiece
    def symbol
        '♞'.colorize(color)
    end
end