def possible_ways(step, arr)
  return 0 if step < 0
  return 1 if step == 0
  return arr[step] if arr[step] && arr[step] >= 0
  arr[step] = possible_ways(step-1, arr) +
    possible_ways(step-2, arr) + possible_ways(step-3, arr)
end


arr = Array.new(10)
puts possible_ways(3, arr)