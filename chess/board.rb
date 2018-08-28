require_relative 'piece'
require 'colorize'

class Board
  
  def initialize
    @sentinal = NullPiece.instance
    @grid = Array.new(8) {Array.new(8) {@sentinal}}
    self.reset_board
  end
  
  def to_s(cursor_pos = nil)
    ret = ""
    @grid.each_with_index do |row, rowi|
      row.each_with_index do |piece, idx|
        back = (rowi + idx).even? ? :light_white : :light_black
        piece_str = piece.to_s.colorize(:color => piece.color)
        if cursor_pos && cursor_pos == [rowi, idx] 
          ret << " #{piece_str} ".colorize(:background => :red) 
        else 
          ret << " #{piece_str} ".colorize(:background => back) 
        end 
        ret << "\n"if idx == row.length - 1
      end 
    end 
    ret
  end 
  
  def [](pos)
    @grid[pos.first][pos.last]
  end
  
  def []=(pos, value)
     @grid[pos.first][pos.last]=value 
  end
  
  def add_piece(piece, pos)
    piece.pos = pos
    self[pos] = piece
  end
  
  def render(cursor_pos = nil)
    to_s(cursor_pos)
  end 
  
  
  def set_color
    for i in (0..7)
       self[[0,i]].set_color(:black)
       self[[1,i]].set_color(:black)
       self[[6,i]].set_color(:cyan)
       self[[7,i]].set_color(:cyan)
    end 
  end
   
  def reset_board
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    pieces.each_with_index do |piece, idx| 
      add_piece(piece.new(self), [0, idx])
      add_piece(piece.new(self), [7, idx])
    end 
    
    for i in (0..7) do 
      add_piece(Pawn.new(self), [1,i])
      add_piece(Pawn.new(self), [6,i])
    end 
    set_color
      
  end
  def move_piece(start,final)
    raise "start is outside board" if @grid[start.first].nil? || @grid[start.first][start.last].nil?
    raise "end is outside board" if @grid[final.first].nil? || @grid[final.first][final.last].nil?
    piece = self[start]
    raise "no piece at #{start}" if piece.null?
    add_piece(@sentinal, start)
    add_piece(piece, final)
  end

  
  
  
end 

if __FILE__ == $PROGRAM_NAME
  b = Board.new 
  puts b.render([4,4])

end 