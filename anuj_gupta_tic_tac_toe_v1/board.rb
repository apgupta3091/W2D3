class Board 

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
        
    end

    def valid?(position)
        if position[0] > -1 && position[0] < 3 && position[1] > - 1 && position[1] < 3
            return true  
        else
            return false
        end
    end

    def empty?(position)
        if @grid[position[0]][position[1]] == "_"
            return true 
        else
            return false 
        end
        
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            @grid[position[0]][position[1]] = mark
        else
            raise "invalid mark"
        end
    end

    def print
        @grid.each do |row|
            p row
        end
    end

    def win_row?(mark)
        i = 0
        @grid.each do |row|
            if row[i] == mark && row[i + 1] == mark && row[i + 2] == mark
                return true 
            end
        end
        false 
    end

    def win_col?(mark)
        j = 0
        i = 0
        (0...@grid.length).each do |k|
            if @grid[i][j] == mark && @grid[i + 1][j] == mark && @grid[ i + 2][j] == mark 
                return true 
            end
            j += 1
        end
        false 
    end

    def win_diagonal?(mark)
        i = 0
        if @grid[i][i] == mark && @grid[i + 1][i + 1] == mark && @grid[i + 2][i + 2] == mark 
            return true 
        elsif @grid[i][i + 2] == mark && @grid[i + 1][i + 1] == mark && @grid[i + 2][i] == mark 
            return true
        else
            return false 
        end
    end

    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true 
        else
            return false 
        end
    end

    def empty_positions?
        num = 9
        count = 0
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                if !empty?([i, j])
                    count += 1
                end
            end
        end
        if count == num 
            return false 
        else 
            return true
        end
    end

end
