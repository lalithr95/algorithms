# Sort arr by placing first unsorted arr element in correct position
def insertion_sort(arr)
  size = arr.size - 1

  for i in 1..size do
    key = arr[i]
    j = i - 1

    while (j >= 0 && arr[j] > key) do
      arr[j+1] = arr[j]
      j -= 1
    end

    arr[j+1] = key
  end
  arr
end

arr = [20, 30, 10, 50, 5, 1]
print insertion_sort(arr)