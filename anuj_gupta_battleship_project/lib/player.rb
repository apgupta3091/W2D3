class Player

    def get_move
        puts "enter a position with coordinates seperated with a space like `4 7`'"
        player_pos = gets.chomp
        new_arr = []
        player_pos.each_char do |char|
            int_num = char.to_i
            if char != " "
                new_arr << int_num
            end
        end
        new_arr
    end
end
