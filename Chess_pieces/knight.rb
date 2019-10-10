require_relative "./chess_piece.rb"
require_relative "./king_knight_module.rb"

class Knight < ChessPiece
    include King_knight
    
    DIRECTIONS = [
        [ 2, 1 ],
        [ 2, -1 ],
        [ -2, 1],
        [ -2, -1],
        [ -1, -2 ],
        [ 1, -2 ],
        [ -1, 2 ],
        [ 1, 2 ]
    ]

    def directions
        DIRECTIONS
    end

    def symbol
        ' ♞ '.colorize(color)
    end
end