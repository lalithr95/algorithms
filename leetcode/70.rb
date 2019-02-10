def climb_stairs(n, arr)
  return 0 if n < 0
  return 1 if n == 0
  return arr[n] if arr[n] && n >=0
  arr[n] = climb_stairs(n-1, arr) + climb_stairs(n-2, arr)
end
arr = Array.new(10)
puts climb_stairs(3, arr)