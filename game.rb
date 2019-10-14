require_relative './dependencies.rb'

class Game
    include Translate_position

    attr_reader :white_player, :black_player, :chess_board, :display
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

        display_game_result
    end
    
    def display_game_result
        result = " #{current_player.color} is checkmated!!! ".colorize(:color => :red, :background => :white)
        system("clear")
        display.render_board
        puts "\n   #{result}\n\n"
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
        player_color = current_player.color
        move_type = chess_board.move_piece(player_color, current_pos, destination_pos)
        if move_type == "PawnMove"
            try_side_attack(destination_pos)
        end
    end

    def try_side_attack(destination_pos)
        pawn = chess_board[destination_pos]
        current_player.display_the_board
        pawn.try_side_attack
    end

    def translate_the_move_command(move_command)
        current_pos = translate_to_board_position(move_command[:start_pos])
        destination_pos = translate_to_board_position(move_command[:destination_pos])
        [ current_pos, destination_pos ]
    end

    def checkmate?
        # Check whether the current player is already checkmated by the other player or not
        king_color = current_player.color
        chess_board.checkmate?(king_color)
    end
end
