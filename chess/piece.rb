require "singleton"

class Piece
  attr_accessor :pos
  
  def initialize
    @symbol = ""
    @team
    @pos
  end 
  
  def to_s 
    @symbol.to_s
  end 
  
  
end 

class Rook < Piece 
  
  def initialize
    @symbol = :R
  end 
  
end 

class Bishop < Piece 
  def initialize
    super
    @symbol = :B
    
  end
  
  
end 

class Knight < Piece 
  def initialize
    super
    @symbol = :N
    
  end

end 

class King < Piece 
  def initialize
    super
    @symbol = :K
    
  end
end 

class Pawn < Piece 
  def initialize
    super
    @symbol = :P
    
  end
end 

class Queen < Piece 
  def initialize
    super
    @symbol = :Q
    
  end
end 

class NullPiece < Piece 
  include Singleton
  def initialize
    @symbol = :_
  end 
  
end 