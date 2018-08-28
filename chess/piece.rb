require "singleton"
require_relative 'slideable'
require_relative 'board'
require_relative 'stepable'
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
  
  def moves 
    horizontal_dirs
  end 
  
  def to_s
    "♖"
  end 
  
end 

class Bishop < Piece 
  
  include Slideable
  
  def moves 
    diagonal_dirs
  end 
  
  def to_s
    "♗"
  end 
  
  
end 

class Queen < Piece 
  
  include Slideable
  
  def to_s
    "♕"
  end 
  
end 

class Knight < Piece 
  
  include Stepable
  
  def to_s
    "♘"
  end 

end 

class King < Piece 
  
  
  include Stepable
  def to_s
    "♔"
  end 
  
  
end 

class Pawn < Piece 
  
  def to_s
    "♙"
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
  knight = King.new(b)
  knight.set_color(:black)
  b.add_piece(knight, [2,7])
  puts b.render
  # p rook.moves
  p knight.moves
  
end 