class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @next_node = nil
    @value = value
  end

  def inspect
    "#<Node value=#{value} next=#{next_node}>"
  end
end

class Stack
  attr_accessor :top

  def initialize
    @top = nil
  end

  def push(value)
    node = Node.new(value)
    node.next_node = top
    self.top = node
  end

  def empty?
    top.nil?
  end

  def peek
    puts top.value if top
  end

  def pop
    return unless top
    node = top
    self.top = top.next_node
    return node.value
  end

  def display
    return unless top
    node = top
    while (node != nil) do
      print node.inspect
      node = node.next_node
    end
    print "\n"
  end
end

# s = Stack.new
# s.push(1)
# s.peek
# s.push(2)
# s.push(3)

# s.display
# s.pop
# s.display
# s.pop
# s.display
# puts s.empty?
# s.pop
# s.display
# puts s.empty?