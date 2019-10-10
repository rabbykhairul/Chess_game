module King_knight
    def possible_moves
        moves = []
        
        DIRECTIONS.each do |dir|
            current_row, current_col = dir[0] + position[0], dir[1] + position[1]

            if within_range?(current_row, current_col)
                current_pos = [ current_row, current_col ]
                current_piece = board[ current_pos ]
                moves << current_pos if current_piece.is_a?(NullPiece) || current_piece.color != self.color
            end
        end

        moves
    end
end