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
  

  
  
  def moves
    result= forward_steps
    side=side_attacks
    side.each do |x|
      if @board[x].color == self.color || @board[x].null?
      else 
        result << x 
      end 
    end 
    result.select{|x| @board[x].null?}
  
    
  end
  
  private
  def on_board?(pos)
    (0..7).to_a.include?(pos[0]) && (0..7).to_a.include?(pos[1])
  end 
  
  def at_start_row?
    if self.color == :black 
      self.pos[0]==1 
    else 
      self.pos[0]==6 
    end 
    
    
  end
  
  def foward_dir
    if self.color == :black 
      1
    else 
      -1 
    end 
  end
  
  def forward_steps
    result = [[self.pos[0]+foward_dir, self.pos[1]] ]
    
    
    result << [self.pos[0]+foward_dir*2, self.pos[1]]   if at_start_row?
     
    result.select{|x| on_board?(x)}
    
    
    
  end
  
  def side_attacks
    result=[[self.pos[0]+foward_dir, self.pos[1]-1]]
    result+=[[self.pos[0]+foward_dir, self.pos[1]+1]]
    result.select{|x| on_board?(x)}
    
    
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
  p b[[6,5]].moves
  puts b.render

  
  
  
end 