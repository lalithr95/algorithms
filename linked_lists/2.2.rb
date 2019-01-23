require_relative 'list'

class List
  def kth_last_node(k)
    node_index = size - k
    return unless node_index >= 0
    node = head
    while (node_index > 0) do
      node = node.next_node
      node_index -= 1
    end
    return node.value
  end

  def kth_last_node_recursive(k, head)
    return 0 if head.nil?

    count = kth_last_node_recursive(k, head.next_node) + 1
    if count == k
      print head.value
    end
    return count
  end

  def kth_last_node_iterative(k)
    node = head
    runner = head
    for i in 0..(k - 1)
      runner = runner.next_node
    end

    while (runner != nil) do
      node = node.next_node
      runner = runner.next_node
    end
    node.value
  end
end

l = List.new
l.insert(1)
l.insert(2)
l.insert(3)
l.insert(4)
print l.kth_last_node(1)
l.kth_last_node_recursive(2, l.head)
print l.kth_last_node_iterative(2)