class HumanPlayer

    attr_reader :mark_value 

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        print "Player #{@mark_value}, enter two numbers representing a position in the format `row col`"
        user_position = gets.chomp
        pos_arr = user_position.split(" ")
        pos_arr.each_with_index do |ele, i|
            pos_arr[i] = ele.to_i 
        end

        if pos_arr.length == 2 
            return pos_arr
        else 
            raise "Sorry that was invalid"
        end
    end

end