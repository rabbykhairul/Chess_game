require_relative "./chess_piece.rb"
require_relative "./king_knight_module.rb"

class King < ChessPiece
    include King_knight

    DIRECTIONS = [
        [ 0, 1 ],
        [ 0, -1 ],
        [ -1, 0 ],
        [ 1, 0 ],
        [ -1, 1 ],
        [ -1, -1 ],
        [ 1, 1 ],
        [ 1, -1 ]
    ]

    def symbol
        ' ♚ '.colorize(color)
    end
end