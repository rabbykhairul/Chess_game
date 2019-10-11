require 'colorize'

class ChessPiece
    attr_reader :color, :board
    attr_accessor :position
    
    def initialize(color, position, board)
        @color = color
        @position = position
        @board = board
    end

    def within_range?(row, col)
        row.between?(0,7) && col.between?(0,7)
    end

    def valid_move?(destination_position)
        # A piece move is valid when the move desitination_position is included in that piece's 
        # possible move positions and moving the piece to the destination_position will not 
        # leave it's own king under check by an enemy piece.
        possible_moves.include?(destination_position) && !moves_into_check?(destination_position)
    end

    def moves_into_check?(destination_position)
        duplicate_board = board.dup
        # Move the piece to its new location in the duplicate_board
        duplicate_board.move_piece!(position, destination_position)
        # Find the king position of the moved piece in the duplicate_board
        king_pos = duplicate_board.find_king(color)
        # Check whether the king is under attack by enemy piece(s) or not.
        is_king_under_attack?(duplicate_board, king_pos) 
    end

    def is_king_under_attack?(duplicate_board, king_pos)
       positions_under_enemy_attack = positions_under_attack_by_enemy_pieces(duplicate_board)
       positions_under_enemy_attack.include?(king_pos) 
    end

    def positions_under_attack_by_enemy_pieces(duplicate_board)
        attacked_positions = []

        enemy_pieces = get_standing_enemy_pieces(duplicate_board)
        enemy_pieces.each do |enemy_piece|
            if enemy_piece.is_a?(Pawn)
                attacked_positions += enemy_piece.side_attacks
            else
                attacked_positions += enemy_piece.possible_moves
            end
        end

        attacked_positions
    end

    def get_standing_enemy_pieces(duplicate_board)
        enemy_color = self.color == :white ? :black : :white
        enemy_pieces = []

        (0...8).each do |row|
            (0...8).each do |col|
                position = [ row, col ]
                piece = duplicate_board[ position ]
                enemy_pieces << piece if piece.color == enemy_color
            end
        end

        enemy_pieces
    end
end