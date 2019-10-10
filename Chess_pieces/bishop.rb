require_relative "./chess_piece.rb"
require_relative "./slideable_module.rb"

class Bishop < ChessPiece
    include Slideable

    def symbol
        ' ♝ '.colorize(color)
    end

    def possible_moves
        find_moves(diagonal_diretion)
    end

    def diagonal_diretion
        DIAGONAL_DIRCTIONS
    end
end