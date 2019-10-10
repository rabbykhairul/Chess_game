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
        move_positions = []
        horizontal_and_vertical_direction.each do |dir|
            move_positions += grow_moves_in_direction(dir)
        end
        move_positions
    end

    def horizontal_and_vertical_direction
        HORIZONTAL_DIRECTIONS + VERTICAL_DIRECTIONS
    end
end