require_relative "./pieces.rb"

class Board
    attr_reader :null_piece

    def initialize
        @null_piece = NullPiece.instance
        @board_grid = Array.new(8) { Array.new(8, @null_piece) }
        place_chess_pieces_on_the_board_grid
    end

    def place_chess_pieces_on_the_board_grid
        place_black_and_white_rooks_in_starting_position
        place_black_and_white_knights_in_starting_position
        place_black_and_white_bishops_in_starting_position
        place_black_and_white_queens_in_starting_position
        place_black_and_white_kings_in_starting_position
        place_black_and_white_pawns_in_starting_position
    end

    def place_black_and_white_pawns_in_starting_position
        pawn_cols = (0..7).to_a
        pawn_rows = { 1 => :black, 6 => :white }
        put_pieces(pawn_rows, pawn_cols, Pawn)
    end

    def place_black_and_white_kings_in_starting_position
        king_cols = [ 4 ]
        put_pieces(starting_rows, king_cols, King)
    end

    def place_black_and_white_queens_in_starting_position
        queen_cols = [ 3 ]
        put_pieces(starting_rows, queen_cols, Queen)
    end

    def place_black_and_white_bishops_in_starting_position
        bishop_cols = [ 2, 5 ]
        put_pieces(starting_rows, bishop_cols, Bishop)
    end

    def place_black_and_white_knights_in_starting_position
        knight_cols = [ 1, 6 ]
        put_pieces(starting_rows, knight_cols, Knight)
    end

    def place_black_and_white_rooks_in_starting_position
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

    def [](position)
        row, col = position
        @board_grid[row][col]
    end

    def piece_symbol(position)
        piece = self[ position ]
        piece.symbol
    end

    def move_piece(current_pos, destination_pos)
        piece = self[ current_pos ]
        self[ current_pos ] = null_piece
        self[ destination_pos ] = piece
    end
end