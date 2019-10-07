require_relative './board.rb'
require_relative './player.rb'

class Game
    attr_reader :white_player, :black_player
    attr_accessor :current_player

    def initialize
        @chess_board = Board.new
        @white_player = Player.new(:white)
        @black_player = Player.new(:black)
        @current_player = @white_player
    end

    def start_game
        until checkmate?
            move_command = current_player.get_move
            make_move(move_command)
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
end