require_relative 'piece'
require 'colorize'

class Board
  
  def initialize
    @sentinal = NullPiece.instance
    @grid = Array.new(8) {Array.new(8) {@sentinal}}
    self.reset_board
  end
  
  def to_s 
    ret = ""
    @grid.each_with_index do |row, rowi|
      row.each_with_index do |piece, idx|
        back = (rowi + idx).even? ? :light_white : :light_black
        piece_str = piece.to_s.colorize(:color => piece.color)
        ret << " #{piece_str} ".colorize(:background => back)
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
  
  def render
    puts self.to_s
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
    # @grid.each_with_index do |x,i|
    #   x.each_with_index do |y,j|
    #     add_piece(Pawn.new(self),[i,j]) if i==1 || i== 6
    #   end 
    # end 
    
    for i in (0..7) do 
      self[[1,i]] = Pawn.new(self)
      self[[6,i]] = Pawn.new(self)
    end 
    set_color
      
    # for i in (0)
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
  # b.add_piece(King.new,[0,0])
  b.render
  
end 