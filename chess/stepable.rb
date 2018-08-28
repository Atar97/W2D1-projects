module Stepable
  
  def moves 
    result = []
    move_diffs.each do |move|
      result << move unless !Stepable.on_board(move) || self.board[move].color == self.color   
    end 
    result
  end
  
  def move_diffs
    if self.is_a?(King)
      move = [[-1,1],[-1,-1],[1,1],[1,-1],[1,0], [0,1], [-1,0], [0,-1]]
    else 
      move = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
    end 
    move.map {|el| Stepable.add(self.pos, el)}
  end  
  
  def self.add(arr1, arr2)
    [arr1[0] + arr2[0], arr1[1] + arr2[1]]
  end  
  
  
  def self.on_board(pos)
    (0..7).to_a.include?(pos[0]) && (0..7).to_a.include?(pos[1])
  end 
  
end 
