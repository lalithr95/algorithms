def min_cost_climbing_stairs(arr)
  size = arr.size
  dp = Array.new(size)
  dp[0] = arr[0]
  dp[1] = arr[1]
  for i in 2..(size - 1) do
    dp[i] = arr[i] + [arr[i-1], arr[i-2]].min
  end
  [dp[size - 1], dp[size - 2]].min
end

arr = [0,1,2,2]
puts min_cost_climbing_stairs(arr)