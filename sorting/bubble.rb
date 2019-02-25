def bubble_sort(arr)
  size = arr.size - 1
  for i in 0..size do
    for j in (i+1)..size do
      if arr[i] > arr[j]
        temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
      end
    end
  end
  return arr
end

arr = [20, 30, 10, 50, 5, 1]
print bubble_sort(arr)