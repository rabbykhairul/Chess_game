require_relative "./chess_piece.rb"
require "singleton"

class NullPiece < ChessPiece
    include Singleton

    def initialize

    end

    def symbol
        "   "
    end
end