# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  size = nums.size
  dp = Array.new(size)
  dp[0] = nums[0]
  max = dp[0]

  for i in 1..(size - 1) do
    dp[i] = [dp[i-1] + nums[i], nums[i]].max
    max = dp[i] if dp[i] > max
  end

  max
end

# Divide and conquor approach
def max_sub_array_dac(nums)
  max_sub_array_recursive(nums, 0, nums.size-1)
end

def max_sub_array_crossing(nums, low, mid, high)
  mid = (low + high) / 2
  left_max = sum = 0
  i = mid 
  while i >= low do
    sum += nums[i]
    left_max = [left_max, sum].max
    i -= 1
  end

  right_max = sum = 0
  i = mid + 1
  while i <= high
    sum += nums[i]
    right_max = [right_max, sum].max 
    i += 1
  end

  left_max + right_max
end

def max_sub_array_recursive(nums, low, high)
  return -1 if low > high
  return nums[low] if low == high
  mid = (low + high) / 2

  left_sum = max_sub_array_recursive(nums, low, mid-1)
  right_sum = max_sub_array_recursive(nums, mid+1, high)
  crossing = max_sub_array_crossing(nums, low, mid, high)
  [crossing, left_sum, right_sum].max
end

nums = [-2,1,-3,4,-1,2,1,-5,4]
# puts max_sub_array(nums)
puts max_sub_array_dac(nums)