class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent
    @parent
  end
  
  def children
    @children
  end
  
  def value
    @value
  end

  def parent=(node)
    if node.nil?
      @parent = nil
    else
      old_parent = self.parent
      old_parent.children.delete(self) unless old_parent.nil?
      
      @parent = node
      node.children << self unless node.children.include?(self)
    end
  end
  
  def add_child(child_node)
    child_node.parent = self
  end
  
  def remove_child(child_node)
    raise "Node is not a child" unless self.children.include?(child_node)
    child_node.parent = nil
  end
  
  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil? 
    end
    nil
  end
  
  def bfs(target_value)
    queue = [self]
  
    until queue.empty?
      current = queue.shift 
      return current if current.value == target_value
      current.children.each { |child| queue.push(child) }
    end 
    
    return nil
  end
  
  #attr_reader :value, :parent, :children
end