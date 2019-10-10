require 'colorize'

class ChessPiece
    attr_reader :color
    attr_accessor :position
    
    def initialize(color, position)
        @color = color
        @position = position
    end
end