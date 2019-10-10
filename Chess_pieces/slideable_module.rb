module Slideable
    HORIZONTAL_DIRECTIONS = [
        [ 1, 0 ],
        [ -1, 0 ]
    ]

    VERTICAL_DIRECTIONS = [
        [ 0, 1 ],
        [ 0, -1 ]
    ]

    def grow_moves_in_direction(dir)
        move_positions = []
        current_row, current_col = position[0] + dir[0], position[1] + dir[1]

        while within_range?(current_row, current_col)
            current_pos = [ current_row, current_col ]
            piece_at_current_pos = board[ current_pos ]

            if piece_at_current_pos.is_a?(NullPiece)
                move_positions << current_pos
            elsif piece_at_current_pos.color == self.color
                break
            else
                move_positions << current_pos
                break
            end

            current_row += dir[0]
            current_col += dir[1]
        end

        move_positions
    end

    def within_range?(row, col)
        row.between?(0,7) && col.between?(0,7)
    end
end