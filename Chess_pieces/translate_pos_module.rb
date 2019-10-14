module Translate_position
    def translate_to_board_position(position_string)
        col_map = {
            'a' => 0,
            'b' => 1,
            'c' => 2,
            'd' => 3,
            'e' => 4,
            'f' => 5,
            'g' => 6,
            'h' => 7
        }

        row = position_string[1].to_i - 1

        col_char = position_string[0]
        col = col_map[col_char]

        position = [ row, col ]
        raise " Position error!!! Please enter valid position(s). " unless valid_pos?(position)
        position
    end

    def valid_pos?(position)
        row, col = position
        row.is_a?(Integer) && col.is_a?(Integer) && row.between?(0,7) && col.between?(0,7)
    end
end