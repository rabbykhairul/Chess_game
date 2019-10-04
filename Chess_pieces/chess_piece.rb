require 'colorize'

class ChessPiece
    attr_reader :color
    
    def initialize(color, position)
        @color = color
        @position = position
    end
end