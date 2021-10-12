class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](arr)
        i = 0
        while i < arr.length - 1
            return @grid[arr[i]][arr[i + 1]]
            i += 1
        end
        
    end

    def []=(pos, val)
        i = 0
        while i <pos.length - 1
            @grid[pos[i]][pos[i + 1]] = val 
            i += 1
        end
    end

    def num_ships
        count = 0
        @grid.each do |subarray|
            subarray.each do |ele|
                if ele == :S
                    count += 1
                end
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S 
            self[pos] = :H 
            puts "you sunk my battleship"
            return true
        else 
            self[pos] = :X 
            return false 
        end
    end

    def place_random_ships
        total_ships = @size * 0.25
        while self.num_ships < total_ships
            pos1 = rand(0...@grid.length)
            pos2 = rand(0...@grid.length)
            new_pos = [pos1, pos2]
            self[new_pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |subarray|
            subarray.map do |ele|
                if ele == :S
                    :N 
                else
                    ele
                end
            end 
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end


end
