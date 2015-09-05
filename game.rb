require_relative 'board'
require_relative 'card'
require_relative 'player'
require_relative 'computer'

class Game

  attr_reader :board, :player

  def initialize(player)
    @player = player
    @board = Board.new
    @first_turn = false
    @first_guess = []
  end

  def play

    until board.won?
      
      # card1 = guess_and_flip_card
      board.render
      guess1 = prompt
      card1 = flip_card(guess1)
      system("clear")
      # card2 = guess_and_flip_card
      board.render
      guess2 = prompt
      card2 = flip_card(guess2)
      system("clear")
      board.render
      if card1 == card2 && guess1 != guess2
        puts "It's a match!"
        # sleep(3)
        card1.value = ' '
        card2.value = ' '
      else
        puts "No Match"
        # sleep(3)
        card1.hide
        card2.hide
      end
      system("clear")
    end
    win_prompt
  end

  def prompt
    pos = player.prompt
    pos = failed_move unless pos.length == 2
    pos = failed_move unless pos.all? { |el| (0...Board::GRID_SIZE).include?(el) }
    board.matched?(pos) ? failed_move : pos
  end

  private

  def flip_card(position)
    card = board.reveal(position)
    player.get_input(card.value, position)
    card
  end

  def failed_move
    puts "Not a valid move. Pick again"
    pos = prompt
  end

  def win_prompt
    puts "You win!"
  end

  # def guess_and_flip_card
    # board.render
    # guess = prompt
    # card = flip_card(guess)
  # end
end

if $PROGRAM_NAME == __FILE__
  game = Game.new(ComputerPlayer.new)
  game.play
end
