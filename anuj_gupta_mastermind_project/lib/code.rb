class Code

  attr_reader :pegs


  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.each do |char|
      upcase_char = char.upcase
      if !POSSIBLE_PEGS.has_key?(upcase_char)
        return false 
      
      end
    end
    true 
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars
      @pegs.each_with_index do |char, i|
        upcase_char = char.upcase
        @pegs[i] = upcase_char
      end
    else
      raise "Pegs are not valid"
    end
  end


  def self.random(length)
    arr = []
    (0...length).each do |num|
      random_char = POSSIBLE_PEGS.keys.sample(1)
      arr << random_char
    end
    flattended_arr = arr.flatten
    Code.new(flattended_arr)
  end

  def self.from_string(pegs)
    arr = pegs.split("")
    Code.new(arr)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    code.pegs.each_with_index do |char, i |
      if char == @pegs[i]
        count += 1
      end
    end
    count
  end

  def num_near_matches(code)
    count = 0
    duplicate_self = self.pegs.dup
    duplicate_code = code.pegs.dup
    
    (0...code.length).each do |i|
      if self[i] == code[i]
        duplicate_code.delete_at(i)
        duplicate_self.delete_at(i)
      
      elsif duplicate_self[i] != duplicate_code[i] && duplicate_self.include?(duplicate_code[i])
        count += 1
      end
      
      
    end
    count
  end

  def ==(other_code)
    if @pegs.length != other_code.pegs.length 
      return false 
    end

    if @pegs == other_code.pegs
      return true 
    else
      return false 
    end
  end

  

end
