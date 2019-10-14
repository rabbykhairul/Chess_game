class Display
    attr_reader :chess_board

    def initialize(chess_board)
        @chess_board = chess_board
    end

    def render_board
        puts "    a  b  c  d  e  f  g  h "
        board_rows_with_chess_symbols.each do |board_row|
            puts board_row
        end
        puts "    a  b  c  d  e  f  g  h "
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
        line = " #{row_num + 1} "
        @bg_color = row_num.even? ? :light_blue : :blue
        (0...8).each do |col_num|
            position = [ row_num, col_num ]
            piece_symbol = get_piece_symbol(position)
            line += piece_symbol.colorize(:background => @bg_color)
            toggle_bg_color!
        end
        line += " #{row_num + 1} "
    end

    def toggle_bg_color!
        @bg_color = @bg_color == :light_blue ? :blue : :light_blue
    end

    def get_piece_symbol(position)
        chess_board.piece_symbol(position)
    end
end
