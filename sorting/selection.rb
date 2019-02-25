
# Finds minimum element from each element and places correctly in first subarray
def selection_sort(arr)
  size = arr.size - 1
  for i in 0..size do
    min_index = i
    for j in (i+1)..size do
      if arr[j] < arr[min_index]
        min_index = j
      end
    end

    temp = arr[min_index]
    arr[min_index] = arr[i]
    arr[i] = temp
  end

  arr
end

arr = [20, 30, 10, 50, 5, 1]
print selection_sort(arr)