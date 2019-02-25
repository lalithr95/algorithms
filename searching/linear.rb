def linear_search(arr, value)
  for i in 0..(arr.size - 1) do
    return i if value == arr[i]
  end
  return -1
end

arr = [10, 20, 80, 30, 60, 50, 110, 100, 130, 170]
puts linear_search(arr, 1100)