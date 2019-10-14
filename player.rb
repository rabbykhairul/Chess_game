class Player
    attr_reader :color, :display
    
    def initialize(color, display)
        @color = color
        @display = display
    end

    def get_move
        display_the_board
        get_the_move_command
    end

    def display_the_board
        system("clear")
        puts " #{color.to_s.capitalize}'s turn! ".colorize(:color => :red, :background => :white)
        puts
        display.render_board
    end

    def get_the_move_command
        puts "Please select a chess piece to move(example: a8 or d1): "
        piece_pos = gets.chomp
        puts "Move to where?(example: b2 or c8)"
        end_pos = gets.chomp
        { :start_pos => piece_pos, :destination_pos => end_pos }
    end
end