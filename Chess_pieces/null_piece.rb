require_relative "./chess_piece.rb"

class NullPiece < ChessPiece
    def initialize

    end

    def symbol
        " "
    end
end