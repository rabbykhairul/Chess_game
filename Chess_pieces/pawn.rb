require_relative "./chess_piece.rb"

class Pawn < ChessPiece
    attr_reader :start_position

    def initialize(color, position, board)
        super
        @start_position = position
    end

    def symbol
        ' ♟ '.colorize(color)
    end

    def at_starting_position?
        position == start_position
    end

    def forward_direction
        color == :black ? 1 : -1
    end
end 