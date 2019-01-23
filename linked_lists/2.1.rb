require_relative 'list'

class List
  def remove_duplicates
    return head if head.nil?
    node = head
    values = Hash.new
    values[node.value] = 1
    while(node && node.next_node != nil) do
      if values[node.next_node.value] == 1
        node.next_node = node.next_node.next_node
      else
        values[node.next_node.value] = 1
        node = node.next_node
      end
    end
  end

  def remove_duplicates_without_memory
    current = head
    while (current.next_node != nil) do
      runner = current.next_node
      while (runner != nil) do
        if runner.value == current.value
          current.next_node = runner.next_node
        end
        runner = runner.next_node
      end
      current = current.next_node
    end
    
  end
end


l = List.new
l.insert(1)
l.insert(1)
l.insert(2)
l.insert(3)
l.insert(3)
l.insert(3)
l.remove_duplicates
print l.display