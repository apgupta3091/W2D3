require_relative "code"

class Mastermind


    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        exact_matches = @secret_code.num_exact_matches(code)
        print exact_matches
        near_matches = @secret_code.num_near_matches(code)
        print near_matches
    end

    def ask_user_for_guess
        print "Enter a code"
        user_guess = gets.chomp
        code = Code.from_string(user_guess)
        print_matches(code)
        @secret_code == code 

    end
end
