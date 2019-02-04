require_relative 'binary_tree'

class BinaryTree
  def is_balanced?(node)
    return true if node.nil?

    height_diff = height(node.left) - height(node.right)
    if height_diff.abs <= 1
      return is_balanced?(node.left) && is_balanced?(node.right)
    else
      return false
    end
  end

  def height(node)
    return 0 if node.nil?
    [height(node.left), height(node.right)].max + 1
  end
end


tree = BinaryTree.new
tree.insert(1)
tree.insert(2)
tree.insert(3)
tree.insert(4)
tree.insert(5)
tree.insert(6)
tree.insert(7)
tree.insert(8)
tree.insert(9)
tree.insert(10)
tree.insert(11)
tree.insert(12)
print tree.is_balanced?(tree.root)