require_relative "./chess_piece.rb"
require_relative "./slideable_module.rb"

class Rook < ChessPiece
    include Slideable

    def symbol
        ' ♜ '.colorize(color)
    end

    def possible_moves
        moves_in_horizontal_and_vertical_direction
    end

    def moves_in_horizontal_and_vertical_direction
        find_moves(horizontal_and_vertical_direction)
    end

    def horizontal_and_vertical_direction
        HORIZONTAL_DIRECTIONS + VERTICAL_DIRECTIONS
    end
end