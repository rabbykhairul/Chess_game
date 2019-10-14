require_relative "./pieces.rb"
require_relative "./duplicate_board.rb"

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
                self[ position ] = piece_type.new(color, position, self)
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

    # Move a chess piece from one position to another only if the move is valid
    def move_piece(player_color, current_pos, destination_pos)
        piece = self[ current_pos ]
        check_move_validity(player_color, piece, destination_pos)
        move_piece!(current_pos, destination_pos)
        if piece.is_a?(Pawn)
            return "PawnMove"
        else
            return "NormalMove"
        end
    end

    # Move a chess piece from one position to another without checking the validity of the move
    def move_piece!(current_pos, destination_pos)
        piece = self[ current_pos ]
        self[ current_pos ] = null_piece
        self[ destination_pos ] = piece
        piece.position = destination_pos
    end

    def check_move_validity(player_color, piece, destination_pos)
        # Prevent player from trying to move the enemy pieces
        raise " You are trying to move your opponent's chess piece -:( " unless player_color == piece.color
        # Prevent move from empty position
        raise " You can't move from empty position. Select a piece to move. " if piece.is_a?(NullPiece)
        # Prevent capturing a king i.e. replacing a king in it's position
        piece_to_be_replaced = self[ destination_pos ]
        raise " You can't replace a king, you can only check a king. " if piece_to_be_replaced.is_a?(King)
        # Prevent illegal move
        raise " Sorry, piece doesn't move like that! " unless piece.valid_move?(destination_pos)
    end
    
    def find_king(king_color)
        (0...8).each do |row|
            (0...8).each do |col|
                position = [ row, col ]
                piece = self[ position ]
                return position if piece.is_a?(King) && piece.color == king_color
            end
        end
    end

    def dup
        Duplicate_board.new(self)
    end

    def checkmate?(king_color)
        king_position = find_king(king_color)
        king = self[ king_position ]
        king.checkmate?
    end
end