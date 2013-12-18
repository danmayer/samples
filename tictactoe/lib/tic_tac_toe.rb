class TicTacToe

  def initialize
    @players = [Player.new("x"),Player.new("o")]
    @board = Board.new
    @move = nil
    @move_number = 0
  end

  def run
    while(@move!='q' && @move_number < 9)
      game_loop
    end
    unless @board.winner
      puts "no one won, it is a tie!"
    end
    puts "game over!"
  end

  private

  def select_player
    if @move_number.even?
      @players[0]
    else
      @players[1]
    end
  end

  def game_loop
    player = select_player
    @board.print
    puts "enter your move player #{player.mark}"
    @move = gets.chomp
    if @move != "q"
      result = @board.make_move(@move, player.mark)
      unless result == false
        @move_number += 1 
        if @board.winner
          puts "#{player.mark} is the Winner!"
          @board.print
          break
        end
      end
    end
  end

end
