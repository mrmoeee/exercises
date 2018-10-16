require_relative "00_tree_node.rb"
require 'byebug'

class KnightsTravails
  attr_reader :start_pos, :board
  
  def initialize(start_pos)
    @start_pos = start_pos
    @board = Array.new(8) {Array.new(8)}
    @visited_positions = [@start_pos]
  end
  

  def self.valid_moves(pos)
    valid_moves = []
    row, col = pos
    neighbors = [[row -1, col -1], [row -1, col], 
                 [row - 1, col + 1], [row, col - 1], 
                 [row, col + 1], [row + 1, col - 1],
                 [row + 1, col], [row + 1, col + 1]]
    neighbors.each do |pair|
      valid_moves << pair if in_range?(pair.first, pair.last) 
    end 
    valid_moves
  end
  
  def new_move_positions(pos)
    moves = KnightsTravails.valid_moves(pos)
    moves.reject! {|move| @visited_positions.include?(move)}
    @visited_positions += moves
    moves
  end
    
  def build_move_tree
    root = PolyTreeNode.new(self.start_pos)

    queue = [root]
    
    until queue.empty?
      #pop node from queue
      current = queue.shift  
      
      child_vals = new_move_positions(current.value)
      child_nodes = child_vals.map { |val| PolyTreeNode.new(val)}
      
      child_nodes.each do |node| 
        node.parent = current #.parent= already checks for repeats
      end
      queue.concat(child_nodes)
    end 
    
    root
  end
  
  def find_path(end_pos)
    tree = self.build_move_tree
    found = tree.bfs(end_pos)
    trace_path_back(found)
  end
  
  # 
  def trace_path_back(node)
    path = [] 
    while node != nil
      path.unshift(node.value)
      node = node.parent
    end
    path
  end
  
  private 
  
  def self.in_range?(num1, num2)
    (0...8).include?(num1) && (0...8).include?(num2)
  end
end

