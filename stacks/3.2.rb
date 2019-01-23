require_relative 'stack'

class Node
  attr_accessor :value, :next_node, :min

  def initialize(value)
    @value = value
    @next_node = nil
  end

  def inspect
    "#<Node value=#{value} min=#{min} next=#{next_node}>"
  end
end

class Stack
  attr_accessor :top

  def push(value)
    node = Node.new(value)
    if top
      node.min = (node.value < top.min) ? node.value : top.min
      node.next_node = top
      self.top = node
    else
      node.min = value
      self.top = node
    end
  end

  def pop
    return unless top
    node = top
    self.top = top.next_node
  end

  def min
    puts top.min if top
  end
end

s = Stack.new
s.push(3)
s.min
s.push(6)
s.min
s.push(2)
s.min
s.push(1)
s.min
s.display
s.pop
s.min