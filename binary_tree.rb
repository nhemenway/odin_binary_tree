class Node
  attr_accessor :value, :parent, :left, :right
  def initialize(value, parent = nil,  left = nil, right = nil)
    @value = value
    @parent = parent
    @left = left
    @right = right
  end

  def inspect
    puts @value
    puts "#{@left.value}  #{@right.value}"
  end

end


class Tree
  attr_accessor :root

  def initialize (ary)
    @root = Node.new(ary.shuffle!.shift)
    @values = ary
    build_tree
  end

  def build_tree
    @values.each { |node| add_node(node, @root) }
  end

  def add_node(value, current_node)
    if value < current_node.value
      if current_node.left.nil?
        current_node.left = Node.new(value, current_node)
      else
        add_node(value, current_node.left)
      end
    else
      if current_node.right.nil?
        current_node.right = Node.new(value, current_node)
      else
        add_node(value, current_node.right)
      end
    end
  end

  def breadth_first_search(value)
    queue = [@root]

    until queue.empty?
      node = queue.shift
      return node if value == node.value
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    return nil
  end

  def depth_first_search(value)
    stack = [@root]
    until stack.empty?
      node = stack.pop
      return node if value == node.value
      stack << node.right unless node.right.nil?
      stack << node.left unless node.left.nil?
    end
  end

  def dfs_rec(value, node = @root)
    return nil if node.nil?
    return node if value == node.value
    left_search  = dfs_rec(value, node.right)
    return left_search unless left_search.nil?
    right_search = dfs_rec(value, node.left)
    return right_search unless right_search.nil?
  end
end


t = Tree.new([5,1,6,4,3,7,8,1,11,61])
puts t.root.value
puts t.breadth_first_search(12)
puts t.breadth_first_search(6).value
puts t.depth_first_search(12)
puts t.depth_first_search(6).value
puts t.dfs_rec(12)
puts t.dfs_rec(6).value





