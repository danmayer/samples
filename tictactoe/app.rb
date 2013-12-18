class Player
  
  attr_accessor :mark
  
  def initialize(mark)
    @mark = mark
  end
  
end

class Board
  
  def initialize
    @board = [[nil,nil,nil],
              [nil,nil,nil],
              [nil,nil,nil]]
end
  
  def print
    @board.each do |row|
      row_text = ''
      row.each do |column|
        mark_or_border = column ? column : '_'
        row_text += "#{mark_or_border}|"
      end
      puts row_text
      end
  end
    
  def winner
    [0,1,2].each do |column|
      line = []
      [0,1,2].each do |row|
        puts "#{column} #{row}" 
        line<<@board[column][row] 
      end
      matchingmarks = line.select{|el| el==line.first}.compact.length
      if matchingmarks ==3
        return true
      end 
    end
    
    [0,1,2].each do |column|
      line = []
      [0,1,2].each do |row|
        puts "#{column} #{row}" 
        line<<@board[row][column] 
      end
      matchingmarks = line.select{|el| el==line.first}.compact.length
      if matchingmarks ==3
        return true
      end 
    end
    
    line = [@board[0][0], @board[0][1], @board[0][2]]
    matchingmarks = line.select{|el| el==line.compact.first}.length
    if matchingmarks ==3
      return true
    end
    return false
  end
  
  def make_move(move, mark)
    if move.match("top")
       column = 0
    elsif move.match("middle")
       column = 1
    elsif move.match("bottom")
       column = 2
  end  

    if move.match("left")
       row = 0
    elsif move.match("center")
      row = 1
    elsif move.match("right")
       row = 2
  end
     
    if column && row && @board[column][row]==nil
       @board[column][row] = mark
    else
      puts "Invalid move. Please try again."
      false
    end
  end

players = [Player.new("x"),Player.new("o")]
board = Board.new
  
move = nil
move_number= 0
while(move!='q')
  player = if move_number.even?
    players[0]
  else
    players[1]
  end
  board.print
  puts "enter your move player #{player.mark}"
  move = gets.chomp
  if move != "q"
    result = board.make_move(move, player.mark)
    unless result == false
      move_number += 1 
      if board.winner
        puts "Winner!"
        break
      end 
    end
  end 
end 
puts "game over!"
end