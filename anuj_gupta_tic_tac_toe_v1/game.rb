require './board.rb'
require './human_player.rb'


class Game 

    attr_reader :player1, :player2, :current_player

    def initialize(player_1_mark, player_2_mark)
        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player1
    end

    def switch_turn
        if @current_player == @player1 
            @current_player = @player2 
        else
            @current_player = @player1
        end
    end

    def play 
        
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                return "Congrats #{@current_player.mark_value} you win!"
                
            else
                self.switch_turn
            end
        end
        return "draw"

    end
end
