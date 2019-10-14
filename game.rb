require_relative './duplicate_board.rb'
require_relative './board.rb'
require_relative './player.rb'
require_relative './display.rb'

class Game
    attr_reader :white_player, :black_player, :chess_board
    attr_accessor :current_player

    def initialize
        @chess_board = Board.new
        @display = Display.new(@chess_board)
        @white_player = Player.new(:white, @display)
        @black_player = Player.new(:black, @display)
        @current_player = @white_player
    end

    def start_game
        until checkmate?
            begin
                move_command = current_player.get_move
                make_move(move_command)
            rescue => e
                puts "-------"
                puts e.message.colorize(:color => :white, :background => :red)
                puts "-------"
                sleep(3)
                retry
            end
            
            switch_player!
        end
    end

    def switch_player!
        if self.current_player == self.white_player
            self.current_player = self.black_player
        else
            self.current_player = self.white_player
        end
    end

    def make_move(move_command)
        current_pos, destination_pos = translate_the_move_command(move_command)
        chess_board.move_piece(current_pos, destination_pos)
    end

    def translate_the_move_command(move_command)
        current_pos = translate_to_board_position(move_command[:start_pos])
        destination_pos = translate_to_board_position(move_command[:destination_pos])
        [ current_pos, destination_pos ]
    end

    def translate_to_board_position(position_string)
        col_map = {
            'a' => 0,
            'b' => 1,
            'c' => 2,
            'd' => 3,
            'e' => 4,
            'f' => 5,
            'g' => 6,
            'h' => 7
        }

        row = position_string[1].to_i - 1

        col_char = position_string[0]
        col = col_map[col_char]

        position = [ row, col ]
        raise "Position error!!! Please enter valid position(s)." unless valid_pos?(position)
        position
    end

    def valid_pos?(position)
        row, col = position
        row.is_a?(Integer) && col.is_a?(Integer) && row.between?(0,7) && col.between?(0,7)
    end

    def checkmate?
        # Check whether the current player is already checkmated by the other player or not
        king_color = current_player.color
        chess_board.checkmate?(king_color)
    end
end

game = Game.new
game.start_game