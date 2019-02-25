class MinHeap
  attr_accessor :nodes, :capacity, :size

  def initialize(capacity)
    @capacity = capacity
    @size = 0
    @nodes = Array.new(@capacity)
  end

  def parent(i)
    (i - 1)/2
  end

  def left(i)
    2*i + 1
  end

  def right(i)
    2*i + 2
  end

  def get_min
    nodes[0]
  end

  def insert(value)
    raise 'Capacity exceeded' if capacity == size

    size += 1
    last_index = size - 1
    nodes[last_index] = value

    while (last_intex != 0 && nodes[parent(last_index)] > nodes[last_index]) do
      temp = nodes[last_index]
      nodes[last_index] = nodes[parent(last_index)]
      nodes[parent(last_index)] = temp
      last_index = parent(last_index)
    end
  end

  def satisfied?(index)
    nodes[index] < nodes[left(index)] && nodes[index] < nodes[right(index)]
  end

  def decrease(index, value)
    
  end

  def extract_min
    if size <= 0
      return -99999
    end


  end
end