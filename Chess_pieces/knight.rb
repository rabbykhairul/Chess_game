require_relative "./chess_piece.rb"

class Knight < ChessPiece
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

    def symbol
        ' ♞ '.colorize(color)
    end
end