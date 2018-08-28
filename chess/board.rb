require_relative 'piece'
class Board
  
  def initialize
    @sentinal = NullPiece.instance
    @grid = Array.new(8) {Array.new(8) {@sentinal}}
    self.reset_board
  end
  
  def to_s 
    ret = ""
    @grid.each do |row|
      row.each_with_index do |piece, idx|
        if idx == row.length - 1
          ret << "|#{piece}|\n"
        else 
          ret << "|#{piece}"
        end 
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
  
  
   
  def reset_board
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    pieces.each_with_index do |piece, idx| 
      add_piece(piece.new(self), [0, idx])
      add_piece(piece.new(self), [7, idx])
    end 
    # for i in (0)
  end

  
  
  
end 

if __FILE__ == $PROGRAM_NAME
  b = Board.new 
  # b.add_piece(King.new,[0,0])
  b.render
  
end 