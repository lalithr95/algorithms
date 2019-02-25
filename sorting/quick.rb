def quick_sort(arr)
  quick_sort_helper(arr, 0, arr.size - 1)
  arr
end

def quick_sort_helper(arr, low, high)
  if low < high
    partion_index = partition(arr, low, high)

    quick_sort_helper(arr, low, partion_index - 1)
    quick_sort_helper(arr, partion_index + 1, high)
  end
end

def partition(arr, low, high)
  pivot = arr[high]

  i = low - 1
  for j in low..(high - 1)
    if arr[j] < pivot
      i += 1
      temp = arr[j]
      arr[j] = arr[i]
      arr[i] = temp
    end
  end

  temp = arr[i+1]
  arr[i+1] = arr[high]
  arr[high] = temp
  i + 1
end

arr = [20, 30, 10, 50, 5, 1]
print quick_sort(arr)