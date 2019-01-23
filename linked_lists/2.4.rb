require_relative 'list'

class List
  # O(n) space O(n) time
  def partition(x)
    node = head
    min_count = 0
    new_list = List.new
    while (node != nil) do
      if node.value < x
        new_list.insert(node.value)
      end
      node = node.next_node
    end

    new_list.insert(x)

    node = head
    while (node != nil) do
      if node.value > x
        new_list.insert(node.value)
      end
      node = node.next_node
    end
    self.head = new_list.head
  end
end

l = List.new
l.insert(1)
l.insert(5)
l.insert(4)
l.insert(3)
l.insert(2)
l.partition(3)
print l.display
