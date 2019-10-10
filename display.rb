require_relative './duplicate_board.rb'
require_relative './board.rb'

class Display
    attr_reader :chess_board

    def initialize(chess_board)
        @chess_board = chess_board
    end

    def render_board
        board_rows_with_chess_symbols.each do |board_row|
            puts board_row
        end
    end

    def board_rows_with_chess_symbols
        board_rows = []
        (0...8).each do |row_num|
            row_line = build_line_for_row(row_num)
            board_rows << row_line
        end
        board_rows
    end

    def build_line_for_row(row_num)
        line = ""
        @bg_color = row_num.even? ? :light_blue : :blue
        (0...8).each do |col_num|
            position = [ row_num, col_num ]
            piece_symbol = get_piece_symbol(position)
            line += piece_symbol.colorize(:background => @bg_color)
            toggle_bg_color!
        end
        line
    end

    def toggle_bg_color!
        @bg_color = @bg_color == :light_blue ? :blue : :light_blue
    end

    def get_piece_symbol(position)
        chess_board.piece_symbol(position)
    end
end



# # Code for testing
# board = Board.new
# display = Display.new(board)
# # p display
# # puts "   ".colorize(:background => :light_blue)
# # puts display.build_line_for_row(1)
# # puts display.build_line_for_row(2)
# puts "Original board: "
# display.render_board

# dup_board = board.dup
# dup_display = Display.new(dup_board)
# puts "Duplicate board: "
# dup_display.render_board

# dup_board.move_piece!([1,0], [5,0])
# puts "Original board after move: "
# display.render_board

# puts "Duplicate board after move: "
# dup_display.render_board