require 'byebug'
require_relative 'board'

class ComputerPlayer

  def initialize
    @guessed = {}
    @unmatched_positions = []
    init(Board::GRID_SIZE)
    @next_guess = []
    @first_guess = false
  end

  def prompt
    @first_guess = !@first_guess
    return @next_guess.shift unless @next_guess.empty?
      # We know about a pair so return the position
    @unmatched_positions.sample
  end

  def get_input(val, position)
    if @guessed.has_key?(val) && @guessed[val] != position
      if @first_guess
        # debugger
        # puts "Adding single position to @next_guess: ", position
        @next_guess << @guessed[val]#,position
        @unmatched_positions -= [position, @guessed[val]]
        # debugger
      else
        @next_guess += [@guessed[val],position]
        @unmatched_positions -= [position, @guessed[val]]
      end
    else
      @guessed[val] = position
    end
  end

  private

  def init(size)
    (0...size).each do |i|
      (0...size).each do |j|
        @unmatched_positions << [i,j]
      end
    end
  end
end
