require "singleton"

class Piece
  attr_accessor :pos
  
  def initialize(board = nil)
    @pos
    @color
    @board = board
  end 
    
  def set_color(color)
    @color = color 
  end 
  
end 

class Rook < Piece 
  
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
  def to_s
    "_"
  end 
end 