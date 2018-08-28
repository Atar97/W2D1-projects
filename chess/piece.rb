require "singleton"
require_relative 'slideable'
require_relative 'board'
class Piece
  attr_accessor :pos, :board
  attr_reader :color
  
  def initialize(board = nil, pos = nil)
    @pos = pos
    @color = :black
    @board = board
  end 
    
  def set_color(color)
    @color = color 
  end 
  
  def moves 
    
  end 
  
  def null?
    false
    
  end
  
end 

class Rook < Piece 
  
  include Slideable
  
  def to_s
    "R"
  end 
  
end 

class Bishop < Piece 
  
  def to_s
    "B"
  end 
  
  
end 

class Knight < Piece 
  def to_s
    "N"
  end 

end 

class King < Piece 
  def to_s
    "K"
  end 
end 

class Pawn < Piece 
  def to_s
    "p"
  end 
end 

class Queen < Piece 
  def to_s
    "Q"
  end 
end 

class NullPiece < Piece 
  
  include Singleton
  
  def initialize
    @color = nil
  end 
  def null?
    true 
    
  end
  def to_s
    " "
  end 
end 

if __FILE__== $PROGRAM_NAME
  b = Board.new
  rook = Rook.new(b, [4,4])
  b.add_piece(rook, [4,4])
  puts b.render
  p rook.moves
  
end 