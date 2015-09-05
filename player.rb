class Player
  def initialize
  end

  def prompt
    puts "Which card do you want to flip?"
    pos = gets.chomp.split(",").select do |el|
      !("a".."z").include?(el.strip)
    end
    pos = pos.map(&:to_i)
  end

  def get_input(val)
  end
end
