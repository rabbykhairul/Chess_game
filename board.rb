require_relative "./pieces.rb"

class Board
    def initialize
        @board_grid = Array.new(8) { Array.new(8, nil) }
        place_chess_pieces_on_the_board_grid
    end

    def place_chess_pieces_on_the_board_grid
        place_blace_and_white_rooks_in_starting_position
        place_blace_and_white_knights_in_starting_position
        place_blace_and_white_bishops_in_starting_position
    end

    def place_blace_and_white_bishops_in_starting_position
        bishop_cols = [ 2, 5 ]
        put_pieces(starting_rows, bishop_cols, Bishop)
    end

    def place_blace_and_white_knights_in_starting_position
        knight_cols = [ 1, 6 ]
        put_pieces(starting_rows, knight_cols, Knight)
    end

    def place_blace_and_white_rooks_in_starting_position
        rook_cols = [ 0, 7 ]
        put_pieces(starting_rows, rook_cols, Rook)
    end

    def starting_rows
        # [ 0, 7 ]
        { 0 => :black, 7 => :white }
    end

    def put_pieces(rows_hash, cols, piece_type)
        rows_hash.each do |row, color|
            cols.each do |col|
                position = [ row, col ]
                self[ position ] = piece_type.new(color, position)
            end
        end
    end

    def []=(position, piece)
        row, col = position
        @board_grid[row][col] = piece
    end
end