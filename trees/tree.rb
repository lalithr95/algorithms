class Node
  attr_accessor :left, :right, :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
  
  def inspect
    return "#<Node left=#{left.nil? ? 'nil' : left.inspect}  " +
    "value=#{value} " + 
    "right=#{right.nil? ? 'nil' : right.inspect}>"
  end
end

class BSTree
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert(value)
    new_node = Node.new(value)
    if head == nil
      self.head = new_node
    else
      node = head
      while true do
        if value < node.value
          if node.left.nil?
            node.left = new_node
            break
          end
          node = node.left
        elsif value > node.value
          if node.right.nil?
            node.right = new_node
            break
          end
          node = node.right
        end
      end
    end
  end

  def inorder
    BSTree.inorder(head)
  end

  def postorder
    BSTree.postorder(head)
  end

  def preorder
    BSTree.postorder(head)
  end

  def self.inorder(current)
    return unless current
    inorder(current.left)
    print " #{current.value} "
    inorder(current.right)
  end

  def self.preorder(current)
    return unless current
    print " #{current.value} "

    preorder(current.left)
    preorder(current.right)
  end

  def self.postorder(current)
    return unless current

    postorder(current.left)
    postorder(current.right)
    print " #{current.value} "
  end

  def insert_recursive(value)
    self.head = BSTree.insert_node_recursively(head, value)
  end

  def self.insert_node_recursively(node, value)
    return Node.new(value) if node == nil
    if value < node.value
      node.left = insert_node_recursively(node.left, value)
    elsif value > node.value
      node.right = insert_node_recursively(node.right, value)
    end

    node
  end

  def search(value)
    if head
      current = head
      while(current != nil) do
        if value < current.value
          current = current.left
        elsif value > current.value
          current = current.right
        else
          return current
        end
      end
    end
  end

  def delete_recursive(value)
    self.head = BSTree.delete_node_recursively(head, value)
  end

  def self.min_value(node)
    current = node
    while (current.left != nil) do
      current = current.left
    end

    current
  end

  def self.delete_node_recursively(node, value)
    return nil if node.nil?

    if value < node.value
      node.left = delete_node_recursively(node.left, value)
    elsif value > node.value
      node.right = delete_node_recursively(node.right, value)
    else
      if node.left.nil?
        node = node.right
        return node
      elsif node.right.nil?
        node = node.left
        return node        
      end

      min_value_node = min_value(node.right)
      node.value = min_value_node.value
      node.right = delete_node_recursively(node.right, node.value)
    end

    node
  end

  def display
    return unless head
    print head.inspect
  end
end

# tree = BSTree.new
# tree.insert_recursive(3)
# tree.insert_recursive(4)
# tree.insert_recursive(5)
# tree.insert_recursive(2)
# tree.insert_recursive(1)
# # tree.display
# # tree.delete_recursive(3)
# # puts '\n'
# # tree.display
# # puts '\n'
# puts tree.search(5).inspect
# tree.inorder