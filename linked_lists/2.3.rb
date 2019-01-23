require_relative 'list'

class List
  def delete_middle_node(node)
    next_node = node.next_node
    node.value = next_node.value
    node.next_node = next_node.next_node
  end

  def middle_node
    list_size = (size / 2) + (size % 2)
    node = head
    while (list_size > 1) do
      list_size -= 1
      node = node.next_node
    end
    return node
  end
end

l = List.new
l.insert('a')
l.insert('b')
l.insert('c')
l.insert('d')
l.insert('e')
l.delete_middle_node(l.middle_node)
print l.display()