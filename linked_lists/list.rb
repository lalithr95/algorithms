class Node
  attr_accessor :next_node, :value

  def initialize(value)
    @next_node = nil
    @value = value
  end

  def inspect
    "#<Node value=#{value} next=#{next_node}>"
  end
end

class List 
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def insert(value)
    new_node = Node.new(value)
    if head.nil?
      self.head = new_node
      return head
    end

    node = head
    while(node.next_node != nil) do
      node = node.next_node
    end
    node.next_node = new_node
  end

  def display
    return [] if head.nil?

    result = []
    node = head
    while(node != nil) do
      result << node.value
      node = node.next_node
    end

    return result
  end

  def delete(value)
    return @ead if head.nil?
    if head.value == value
      self.head = head.next_node
      return head
    end

    node = head
    while (node.next_node != nil) do
      if (node.next_node.value == value)
        node.next_node = node.next_node.next_node
        return head
      end
      node = node.next_node
    end
    return head
  end

  def insert_head(value)
    if head.nil?
      self.head = Node.new(value)
      return head
    else
      temp = head
      self.head = Node.new(value)
      self.head.next_node = temp
      return head
    end
  end

  def reverse
    node = head
    reversed = List.new
    while (node != nil) do
      reversed.insert_head(node.value)
      node = node.next_node
    end
    return reversed.head
  end    

  def size
    node = head
    count = 0
    while (node != nil) do
      count += 1
      node = node.next_node
    end
    return count
  end
end

# l = List.new
# l.insert(1)
# l.insert(2)
# l.insert(3)
# l.insert(4)
# l.delete(4)
# print l.display