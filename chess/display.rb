require 'colorize'
require_relative 'board'
require_relative 'cursor'


class Display 
  attr_reader :cursor
  
  def initialize(board=Board.new)
    @board = board
    @cursor = Cursor.new([0,0],@board)
  end 
  
  def render
    system('clear to start')
    puts @board.render(@cursor.cursor_pos)
  end
  
  def move_cursor
    @cursor.get_input
    
  end 
  
end

if __FILE__== $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.render
  while d.cursor.go
    d.move_cursor
    d.render
  end 
end 