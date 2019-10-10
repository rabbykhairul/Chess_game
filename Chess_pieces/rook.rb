require_relative "./chess_piece.rb"
require_relative "./slideable_module.rb"

class Rook < ChessPiece
    include Slideable

    def symbol
        ' ♜ '.colorize(color)
    end

    def possible_moves
        find_moves(horizontal_and_vertical_direction)
    end

    def horizontal_and_vertical_direction
        HORIZONTAL_DIRECTIONS + VERTICAL_DIRECTIONS
    end
end