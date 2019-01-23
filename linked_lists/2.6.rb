require_relative 'list'

class List
  def detect_loop
    first_runner = head
    second_runner = head

    while (first_runner && second_runner && second_runner.next_node) do
      first_runner = first_runner.next_node
      second_runner = second_runner.next_node.next_node

      if first_runner == second_runner
        return true
      end
    end

    return false
  end

  def find_beginning_node
    slow = head
    fast = head

    while(fast != nil && fast.next_node != nil) do
      slow = slow.next_node
      fast = fast.next_node.next_node

      if slow == fast
        break
      end
    end

    if fast.nil? || fast.next_node.nil?
      return
    end

    slow = head
    while (slow != fast) do
      slow = slow.next_node
      fast = fast.next_node
    end

    return fast
  end
end

# a -> b -> c -> d -> e -> c
l = List.new
l.insert('a')
l.insert('b')
node1 = l.insert('c')
l.insert('d')
node2 = l.insert('e')
node2.next_node = node1

print l.find_beginning_node.inspect