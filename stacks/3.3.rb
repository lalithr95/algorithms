require_relative 'stack'

class StackLimitExceeded < StandardError; end

class LimitedStack
  attr_accessor :top, :limit, :size

  def initialize(limit = 3)
    @top = nil
    @limit = limit
    @size = 0
  end

  def push(value)
    raise StackLimitExceeded if size == limit
    node = Node.new(value)
    node.next_node = top
    self.top = node
    self.size += 1
    self.top
  end

  def pop
    return unless top
    self.top = top.next_node
    self.size -= 1
    self.top
  end

  def inspect
    "#<LimitedStack size=#{size}>"
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

  def empty?
    size == 0
  end
end

class SetsOfStacks
  attr_accessor :stacks

  def initialize
    @stacks = Stack.new
  end

  def push(value)
    if stacks.top
      stacks.top.value.push(value)
    else
      stack = LimitedStack.new
      stack.push(value)
      self.stacks.push(stack)
    end
  rescue StackLimitExceeded
    new_stack = LimitedStack.new
    new_stack.push(value)
    self.stacks.push(new_stack)
  end

  def pop
    return unless stacks.top
    stack = stacks.top.value
    stack.pop

    if stack.empty?
      stacks.pop
    end
  end

  def peek
    @stacks.top.value
  end

  def display
    return unless stacks.top
    stack = stacks.top
    while (stack != nil) do
      print stack.value.inspect
      print stack.value.display
      stack = stack.next_node
    end

    print "\n"
  end
end


s = SetsOfStacks.new
s.push(1)
s.push(2)
s.push(3)
s.push(4)
s.push(5)
s.pop
s.pop
s.display