require_relative "./chess_piece.rb"
require_relative "./slideable_module.rb"

class Bishop < ChessPiece
    include Slideable

    def symbol
        ' ♝ '.colorize(color)
    end

    def possible_moves
        find_moves(diagonal_direction)
    end

    def diagonal_direction
        DIAGONAL_DIRECTIONS
    end
end