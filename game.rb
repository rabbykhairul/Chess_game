require_relative './board.rb'
require_relative './player.rb'

class Game
    def initialize
        @chess_board = Board.new
        @white_player = Player.new(:white)
        @black_player = Player.new(:black)
    end
end