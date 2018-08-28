require 'byebug'
module Slideable
  
  HORIZONTAL_DIRS = [[1,0], [0,1], [-1,0], [0,-1]]
  DIAGONAL_DIRS = [[-1,1],[-1,-1],[1,1],[1,-1]]
  
  def horizontal_dirs 
    result=[]
    HORIZONTAL_DIRS.each do |x|
      result+= grow_unblocked_moves_in_dir(x)
    end 
    result
    
  end 
  
  def diagonal_dirs
    result=[]
    DIAGONAL_DIRS.each do |x|
      result += grow_unblocked_moves_in_dir(x)
    end 
    result
  end 
  
  def moves 
    diagonal_dirs + horizontal_dirs 
  end 
  
  private 
  
  def move_dirs
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end 
  
  def grow_unblocked_moves_in_dir(directions)
    # byebug
    current_check = Slideable.add(self.pos, directions)
    result = []
    while true
      if !Slideable.on_board(current_check) || self.board[current_check].color == self.color
        return result
      elsif !self.board[current_check].null?
        result << current_check
        return result
      else 
        result << current_check
      end 
      current_check = Slideable.add(current_check, directions)
    end 
  end 
  
  def self.add(arr1, arr2)
    [arr1[0] + arr2[0], arr1[1] + arr2[1]]
  end 
  
  def self.on_board(pos)
    (0..7).to_a.include?(pos[0]) && (0..7).to_a.include?(pos[1])
  end 
  
end 