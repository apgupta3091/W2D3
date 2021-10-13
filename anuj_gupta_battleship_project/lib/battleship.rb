require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new()
        @board = Board.new(n)
        @remaining_misses = (n * n) / 2

    end


    def start_game
        @board.place_random_ships
        print @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            print "you lose"
            return true 
        else
            return false 
        end
    end

    def win?
        if @board.num_ships < 1
            print "you win"
            return true
        else
            return false 
        end
    end
    

    def game_over?
        if self.win? ||self.lose? 
            return true 
        else
            return false 
        end
    end

    def turn
        player_move = @player.get_move
        attack = @board.attack(player_move)
        if !attack 
            @remaining_misses -= 1
        end
        @board.print
        print @remaining_misses
                    
        
    end

end
