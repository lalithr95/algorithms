require_relative '../linked_lists/list'

class List
  def swap_pairs(root)
    if root.next_node
      temp = root
      root = root.next_node
      temp.next_node = root.next_node
      root.next_node = temp
      swap_pairs(root.next_node.next_node)
    end
  end
end