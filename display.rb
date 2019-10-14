require_relative './duplicate_board.rb'
require_relative './board.rb'

#
require "byebug"

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



# # Code for testing
# board = Board.new
# display = Display.new(board)
# # # p display
# # # puts "   ".colorize(:background => :light_blue)
# # # puts display.build_line_for_row(1)
# # # puts display.build_line_for_row(2)
# puts "Original board: "
# display.render_board
# board.move_piece!([7,3],[2,5])
# puts "After move: "
# display.render_board
# piece = board[[1,4]]
# p piece.position
# p piece.side_attacks

# dup_board = board.dup
# dup_display = Display.new(dup_board)
# puts "Duplicate board: "
# dup_display.render_board

# dup_board.move_piece!([1,0], [5,0])
# puts "Original board after move: "
# display.render_board

# puts "Duplicate board after move: "
# dup_display.render_board
# board.move_piece([6,5], [5,5])
# board.move_piece([1,4], [3,4])
# board.move_piece([6,6], [4,6])
# board.move_piece([0,3], [4,7])
# pawn = board[[6,7]]
# p pawn.possible_moves
# white_rook = board[ [7,3] ]
# black_pawn1 = board[ [1,5] ]
# black_pawn2 = board[ [1,6] ]
# black_pawn3 = board[ [1,7] ]
# black_king = board[ [0,4] ]
# (0...8).each do |row|
#     (0...8).each do |col|
#         position = [row, col]
#         board[position] = board.null_piece
#     end
# end

# board[[0,3]] = white_rook
# white_rook.position = [0,3]
# board[[0,6]] = black_king
# black_king.position = [0,6]
# board[[1,5]] = black_pawn1
# board[[1,6]] = black_pawn2
# board[[1,7]] = black_pawn3
# display.render_board
# p board.checkmate?(:black)
# # debugger
# # p board.checkmate?(:white)