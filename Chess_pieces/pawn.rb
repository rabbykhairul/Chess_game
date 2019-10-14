require_relative "./chess_piece.rb"
require_relative "./translate_pos_module.rb"

class Pawn < ChessPiece
    include Translate_position

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

    def possible_moves
        moves = []

        current_row, current_col = forward_direction + position[0], position[1]

        if within_range?(current_row, current_col)
            current_position = [ current_row, current_col ]
            moves << current_position if can_move_to?(current_position)
            
            if at_starting_position? && !moves.empty?
                current_row += forward_direction
                current_position = [ current_row, current_col ]
                moves << current_position if can_move_to?(current_position)
            end
        end

        moves
    end

    def can_move_to?(position)
        piece_at_position = board[ position ]
        piece_at_position.is_a?(NullPiece)
    end

    def try_side_attack
        available_attacks = side_attacks
        unless available_attacks.empty?
            puts
            puts " The moved pawn can attack enemy piece(s). ".colorize(:color => :red, :background => :white)
            sleep(2)

            if available_attacks.length == 1
                perform_the_default_attack(available_attacks)
            else
                let_the_player_choose_the_attack(available_attacks)
            end
        end
    end

    def let_the_player_choose_the_attack(available_attacks)
        puts
        puts " Please choose a side attack (example: a5 or b7) ".colorize(:color => :red, :background => :white)
        position_string = gets.chomp
        enemy_piece_position = translate_to_board_position(position_string)
        if available_attacks.include?(enemy_piece_position)
            capture_enemy_piece_at_pos(enemy_piece_position)
        else
            raise " Please choose currect side attack "
        end
    end

    def capture_enemy_piece_at_pos(enemy_piece_position)
        attacked_piece = board[ enemy_piece_position ]
        board[ enemy_piece_position ] = board.null_piece unless attacked_piece.is_a?(King)
    end

    def perform_the_default_attack(available_attacks)
        puts
        puts " Performing the default attack on your behalf! -:) ".colorize(:color => :red, :background => :white)
        sleep(3)

        enemy_piece_position = available_attacks.first
        attacked_piece = board[ enemy_piece_position ]
        board[ enemy_piece_position ] = board.null_piece unless attacked_piece.is_a?(King)
    end

    def side_attacks
        attacked_row = position[0] + forward_direction
        side_attacked_positions = []
        # Checking the right side for attack validity
        attacked_col = position[1] + 1
        side_attacked_positions << [ attacked_row, attacked_col ] if enemy_piece?(attacked_row, attacked_col)
        # Checking the left side for attack validity
        attacked_col = position[1] - 1
        side_attacked_positions << [ attacked_row, attacked_col ] if enemy_piece?(attacked_row, attacked_col)

        side_attacked_positions
    end

    def enemy_piece?(attacked_row, attacked_col)
        attacked_position = [ attacked_row, attacked_col ]
        return false unless within_range?(attacked_row, attacked_col)
        
        attacked_piece = board[ attacked_position ]
        !attacked_piece.is_a?(NullPiece) && attacked_piece.color != self.color
    end
end