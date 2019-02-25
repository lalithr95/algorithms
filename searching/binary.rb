def binary_search(arr, value)
  binary_search_helper(arr, value, 0, arr.size-1)
end

def binary_search_helper(arr, value, low, high)
  return -1 if low > high

  mid = (low + high) / 2

  return mid  if arr[mid] == value
  
  return binary_search_helper(arr, value, low, mid-1)  if (arr[mid] > value)
  return binary_search_helper(arr, value, mid+1, high) if (arr[mid] < value)
end

def binary_search_iterative(arr, value)
  low = 0
  high = arr.size - 1
  while (low <= high) do
    mid = (low + high) / 2

    return mid if arr[mid] == value
    if arr[mid] > value
      high = mid - 1
    end

    if arr[mid] < value
      low = mid + 1
    end
  end

  return -1
end

arr = [2, 3, 4, 10, 40, 50]
value = 50
puts binary_search(arr, value)
puts binary_search_iterative(arr, value)