def total_fruit(tree)
  size = tree.size
  return size if size < 3

  max_length = 2
  fruits = Hash.new
  left = right = 0
  while (right < size) do
    if fruits.keys.size < 3
      fruits[tree[right]] = right
      right += 1
    end

    if fruits.keys.size == 3
      delete_value = fruits.values.min
      delete_index = fruits[delete_value]
      fruits.delete(delete_value)
      left = delete_index + 1
    end
    puts left

    max_length = [max_length, (right - left)].max
  end

  max_length
end

tree = [1,1,6,5,6,6,1,1,1,1]
puts total_fruit(tree)