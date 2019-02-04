require_relative 'tree'

class BSTree
  def build_minimal_bst(arr)
    self.head = minimal_bst_tree(arr, 0, arr.size - 1)
  end

  def minimal_bst_tree(arr, low, high)
    return nil if high < low

    mid = (low + high) / 2
    node = Node.new(arr[mid])
    node.left = minimal_bst_tree(arr, low, mid - 1)
    node.right = minimal_bst_tree(arr, mid + 1, high)
    node
  end
end

tree = BSTree.new
tree.head = tree.build_minimal_bst([1,2,3,4,5])
tree.display