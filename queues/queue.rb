class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end

  def inspect
    "#<Node value=#{value} next=#{next_node}>"
  end
end

class Queue
  attr_accessor :first, :last

  def initialize
    @first = @last = nil
  end

  def push(value)
    node = Node.new(value)
    if first
      self.last.next_node = node
      self.last = last.next_node
    else
      self.first = self.last = node
    end
  end

  def pop
    return unless first

    node = first
    self.first = first.next_node
    if first.nil?
      self.last = first
    end
    return node.value
  end

  def empty?
    first.nil? && last.nil?
  end

  def display
    return unless first

    node = first

    while (node != nil) do
      print node.inspect
      node = node.next_node
    end
    print "\n"
  end

  def first_value
    first.value if first
  end

  def last_value
    last.value if last
  end
end

# q = Queue.new
# q.push(1)
# q.push(2)
# q.push(3)

# q.display
# q.pop
# q.display
# q.pop
# q.display
# q.pop
# puts q.empty?