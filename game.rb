require_relative './board.rb'
require_relative './player.rb'

class Game
    def initialize
        @chess_board = Board.new
        @white_player = Player.new(:white)
        @black_player = Player.new(:black)
    end

    def start_game
        until checkmate?
            move_command = current_player.get_move
            make_move(move_command)
            switch_player!
        end
    end
end