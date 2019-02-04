class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = @right = nil
  end
  
  def inspect
    return "#<Node left=#{left.nil? ? 'nil' : left.inspect} " +
     "value=#{value} " +
     "right=#{right.nil? ? 'nil' : right.inspect}>"
  end

  def view
    "#<Node value=#{value}>"
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def insert(value)
    return (self.root = Node.new(value)) unless root
    queue = Queue.new
    queue.push(root)

    while (!queue.empty?) do
      temp = queue.pop
      if temp.left
        queue.push(temp.left)
      else
        temp.left = Node.new(value)
        break
      end

      if temp.right
        queue.push(temp.right)
      else
        temp.right = Node.new(value)
        break
      end
    end
  end

  def search(value)
    return unless root
    q = Queue.new
    q.push(root)

    while (!q.empty?) do
      temp = q.pop
      if temp.value == value
        return puts temp.view
      end
      
      q.push(temp.left) if temp.left
      q.push(temp.right) if temp.right
    end
  end

  def find_recently_added
    q = Queue.new
    q.push(root)
    temp = nil
    while(!q.empty?) do
      temp = q.pop
      q.push(temp.left) if temp.left
      q.push(temp.right) if temp.right
    end
    temp
  end

  def delete(value)
    return unless root
    recent_added = find_recently_added 

    node = root
    q = Queue.new
    q.push(root)
    while (!q.empty?) do
      temp = q.pop
      if temp.value == value
        temp.value = recent_added.value
      end

      if temp.left
        if temp.left.value == recent_added.value
          temp.left = nil
        else
          q.push(temp.left)
        end
      end

      if temp.right
        if temp.right.value == recent_added.value
          temp.right = nil
        else
          q.push(temp.right)
        end
      end
    end
  end

  def print_vertical
    return unless root
    hash = Hash.new
    index = 0
    q = Queue.new
    q.push([root, index])

    while (!q.empty?) do
      temp = q.pop
      if hash[temp.last]
        hash[temp.last] << temp.first.value
      else
        hash[temp.last] = [temp.first.value]
      end

      if temp.first.left
        q.push([temp.first.left, temp.last - 1])
      end

      if temp.first.right
        q.push([temp.first.right, temp.last + 1])
      end
    end

    print hash
  end

  def display
    print root.inspect
    print "\n"
  end

  def self.inorder(node)
    return unless node
    inorder(node.left)
    print node.inspect
    inorder(node.right)
  end
end

# tree = BinaryTree.new
# tree.insert(1)
# tree.insert(2)
# tree.insert(3)
# tree.insert(4)
# tree.insert(5)
# tree.insert(6)
# tree.insert(7)
# tree.insert(8)
# tree.insert(9)
# tree.insert(10)
# tree.insert(11)
# tree.insert(12)
# tree.display
# # tree.search(5)
# # tree.delete(1)
# # tree.display
# tree.print_vertical