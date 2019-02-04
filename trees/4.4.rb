require_relative 'binary_tree'

class BinaryTree
  def lists_by_depth
    q = Queue.new
    q.push([1, root])
    hash = Hash.new

    while (!q.empty?) do
      node = q.pop
      depth = node.first
      temp = node.last

      if hash[depth]
        hash[depth] << temp.value
      else
        hash[depth] = [temp.value]
      end
      if temp.left
        q.push([depth + 1, temp.left])
      end

      if temp.right
        q.push([depth + 1, temp.right])
      end
    end

    print hash
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
tree.lists_by_depth