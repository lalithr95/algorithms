def merge_sort(arr)
  merge_sort_helper(arr, 0, arr.size - 1)
  arr
end

def merge_sort_helper(arr, low, high)
  if low < high
    mid = (low + high) / 2

    merge_sort_helper(arr, low, mid)
    merge_sort_helper(arr, mid + 1, high)
    merge(arr, low, mid, high)
  end
end

def merge(arr, low, mid, high)
  left_arr_size = (mid - low + 1)
  right_arr_size = (high - mid)

  left_arr = Array.new(left_arr_size)
  right_arr = Array.new(right_arr_size)

  for i in 0..(left_arr_size - 1) do
    left_arr[i] = arr[low + i]
  end

  for j in 0..(right_arr_size - 1) do
    right_arr[j] = arr[j + mid + 1]
  end

  i = j = 0
  k = low
  while (i < left_arr_size && j < right_arr_size) do
    if (left_arr[i] <= right_arr[j])
      arr[k] = left_arr[i]
      i += 1
    else 
      arr[k] = right_arr[j]
      j += 1
    end

    k += 1
  end

  while(i < left_arr_size) do
    arr[k] = left_arr[i]
    i += 1
    k += 1
  end

  while(j < right_arr_size) do
    arr[k] = right_arr[j]
    j += 1
    k += 1
  end
end

arr = [20, 30, 10, 50, 5, 1]
print merge_sort(arr)