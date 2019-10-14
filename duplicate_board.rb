require_relative "./board.rb"

# This class creates a deep duplication of the original chess board in a different memory location.
# Because each chess piece contians a reference to the board, any test move or change made in the duplicate
# board will affect the original board if this deep duplication is not created.
#
# By deep duplication it creates,
#   an exact copy of the current board state
#   exact copy of each board pieces currently standing on the board

class DuplicatBoard < Board
    def initialize(original_board)
        @null_piece = NullPiece.instance
        @board_grid = Array.new(8) { Array.new(8, @null_piece) }
        duplicate_the_original_board(original_board)
    end

    def duplicate_the_original_board(original_board)
        (0...8).each do |row|
            (0...8).each do |col|
                position = [ row, col ]
                original_piece = original_board[ position ]
                self[ position ] = duplicate_of_the_original_piece(original_piece, position)
            end
        end
    end

    def duplicate_of_the_original_piece(original_piece, position)
        return original_piece if original_piece.is_a?(NullPiece)

        duplicate_piece_color = original_piece.color
        duplicate_piece_type = detect_original_piece_type(original_piece)
        duplicate_piece_type.new(duplicate_piece_color, position, self)
    end

    def detect_original_piece_type(original_piece)
        piece_types = [ Rook, Bishop, Knight, King, Queen, Pawn ]
        piece_types.each do |type|
            return type if original_piece.is_a?(type)
        end
    end
end