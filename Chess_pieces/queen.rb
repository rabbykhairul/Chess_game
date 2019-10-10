require_relative "./chess_piece.rb"
require_relative "./slideable_module.rb"

class Queen < ChessPiece
    include Slideable

    def symbol
        ' ♛ '.colorize(color)
    end

    def possible_moves
        moves_in_horizontal_vertical_diagonal_direction
    end

    def moves_in_horizontal_vertical_diagonal_direction
        find_moves(horizontal_vertical_diagonal_direction)
    end

    def horizontal_vertical_diagonal_direction
        HORIZONTAL_DIRECTIONS + VERTICAL_DIRECTIONS + DIAGONAL_DIRECTIONS
    end
end