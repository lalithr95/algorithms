class NumArray
  def initialize(nums)
    @nums = nums 
    size = @nums.size
    @dp = Array.new(size)
    @dp[0] = @nums[0]
    for index in 1..(size - 1) do
      @dp[index] = @dp[index-1] + @nums[index]
    end
  end
  
  def sum_range(i, j)
    return @dp[j] if i == 0
    @dp[j] - @dp[i-1]
  end
end
  
# Your NumArray object will be instantiated and called as such:
nums = [-2, 0, 3, -5 ,2, -1]
obj = NumArray.new(nums)
puts obj.sum_range(0, 5)