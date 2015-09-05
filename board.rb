require_relative 'card'

class Board

  GRID_SIZE = 4

  def initialize
    @grid = Array.new(GRID_SIZE) { Array.new(GRID_SIZE)}
    populate
  end

  def populate
    val_arry = (1..(GRID_SIZE**2)/2).to_a
    val_arry *= 2
    val_arry.shuffle!

    GRID_SIZE.times do |i|
      GRID_SIZE.times do |j|
        @grid[i][j] = Card.new(val_arry.pop)
      end
    end
  end

  def render
    puts "Col   #{(0...GRID_SIZE).to_a.join(" ")}"
    @grid.each_with_index do |row, idx|
      row_array = []
      row.each do |card|
        row_array << card.to_s
      end
      puts "Row #{idx} #{row_array.join(" ")}"
    end
  end

  def reveal(guessed_pos)
    @grid[guessed_pos[0]][guessed_pos[1]].reveal
  end

  def won?
    @grid.flatten.all? {|card| card.value == " "}
  end

  def matched?(position)
    @grid[position[0]][position[1]].value == " "
  end
end
