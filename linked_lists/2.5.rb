require_relative 'list'

class List
  def self.sum_reverse(a, b)
    carry = 0
    a_node = a
    b_node = b
    a_prev = a
    b_prev = b
    while (a_node != nil && b_node != nil ) do
      value = a_node.value + b_node.value + carry
      if value > 10
        a_node.value = value % 10 
        carry = 1
      else
        a_node.value = value
        carry = 0
      end
      a_prev = a_node
      b_prev = b_node
      a_node = a_node.next_node
      b_node = b_node.next_node
    end

    if a_node.nil?
      a_prev.next_node = b_node
      a_node = a_prev.next_node
    end
  
    while (a_node != nil) do
      value = a_node.value + carry
      if value > 10
        a_node.value = value % 10 
        carry = 1
      else
        a_node.value = value
        carry = 0
      end
      a_prev = a_node
      a_node = a_node.next_node
    end

    if carry
      a_prev.next_node = Node.new(carry)
    end

    reverse_head = List.new(a).reverse
    List.new(reverse_head).display
  end

  def self.sum_reverse_recursive(a, b, carry)
    if a != nil || b != nil
      sum = (a.nil? ? 0 : a.value) + (b.nil? ? 0 : b.value) + carry
      carry = sum >= 10 ? 1 : 0
      a = (a.nil? ? a : a.next_node)
      b = (b.nil? ? b : b.next_node)
    else
      if carry > 0
        return Node.new(carry)
      else
        return nil
      end
    end

    node = Node.new(sum % 10)
    node.next_node = sum_reverse_recursive(a, b, carry)
    return node
  end
end

l1 = List.new
l1.insert(7)
l1.insert(1)
l1.insert(6)
l2 = List.new
l2.insert(5)
l2.insert(9)
l2.insert(2)
# l3 = List.sum_reverse(l1.head, l2.head)
head = List.sum_reverse_recursive(l1.head, l2.head, 0)
print List.new(head).display
# print l3.display
