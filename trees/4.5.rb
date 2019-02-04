require_relative 'binary_tree'

class BinaryTree
  def check_bst?(node, value, sign)
    return true if node.nil?
    
    if sign == :left
      return value > node.value
    end
    
    if sign == :right
      return value < node.value
    end
    
    check_bst?(node.left, node.value, :left) && check_bst?(node.right, node.value, :right)
  end

  def check_bst_inorder?(node, recent_value)
    return true if node.nil?

    if !check_bst_inorder?(node.left, recent_value)
      return false
    end

    if recent_value != nil && recent_value > node.value
      return false
    end
    recent_value = node.value

    if !check_bst_inorder?(node.right, recent_value)
      return false
    end

    true
  end
end


tree = BinaryTree.new
tree.insert(4)
tree.insert(2)
tree.insert(6)
tree.insert(1)
tree.insert(3)
tree.insert(5)
print tree.check_bst_inorder?(tree.root, nil)