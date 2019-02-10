# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  mid = (prices.size) / 2
  buy = find_min(prices, 0, mid)
  sell = find_max(prices, mid + 1, high)
  sell - buy > 0 ? sell - buy : 0
end

def max_profit_bruteforce(prices)
  profit = 0
  for i in 0..(prices.size - 1) do
    for j in (i+1)..(prices.size - 1) do
      if prices[i] < prices[j] && profit < (prices[j] - prices[i])
        profit = prices[j] - prices[i]
      end
    end
  end
  return profit
end

def find_max(prices, low, high)

end

def find_min(prices, low, high)
end

print max_profit(prices)