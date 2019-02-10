# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  size = nums.size
  return 0 if size == 0
  dp = Array.new(size)
  dp[0] = nums[0]
  for i in 1..(size - 1) do
    dp[i] = [dp[i-1], (dp[i-2] || 0) + nums[i]].max 
  end
  dp[size-1]
end

nums = [2,1,1,2]
puts rob(nums)