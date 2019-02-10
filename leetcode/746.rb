def min_cost_climbing_stairs(arr)
  size = arr.size
  dp = Array.new(size)
  dp[0] = arr[0]
  dp[1] = arr[1]
  for i in 2..(size - 1) do
    dp[i] = arr[i] + [dp[i-1], dp[i-2]].min
  end
  [dp[size - 1], dp[size - 2]].min
end

arr = [1,1,0,0]
puts min_cost_climbing_stairs(arr)