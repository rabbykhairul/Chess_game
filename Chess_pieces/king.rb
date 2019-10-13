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

    def directions
        DIRECTIONS
    end

    def symbol
        ' ♚ '.colorize(color)
    end

    def checkmate?
        return false unless is_king_under_attack?(board, position)
        
        if king_can_be_saved?
            return false
        else
            return true
        end
    end

    def king_can_be_saved?
        friendly_pieces = get_friendly_pieces
        friendly_pieces.each do |friendly_piece|
            return true if has_a_move_that_will_save_king?(friendly_piece)
        end

        false
    end
    
    def has_a_move_that_will_save_king?(piece)
        possible_moves_of_the_piece = piece.possible_moves
        possible_moves_of_the_piece.each do |possible_move|
            return true unless piece.moves_into_check?(possible_move)
        end

        false
    end

    def get_friendly_pieces
        get_pieces_of_color(color, board)
    end
end