def num_islands(grid)
  islands = 0
  for i in 0..(grid.size - 1) do
    for j in 0..(grid[i].size - 1) do
      if grid[i][j] == 1
        islands += 1
        dfs(grid, i, j)
      end
    end
  end
  islands
end

def dfs(grid, i, j)
  row_size = grid.size
  col_size = grid[0].size

  if (i < 0 || j < 0 || i >= row_size || j >= col_size || grid[i][j] == 0)
    return
  end

  grid[i][j] = 0
  dfs(grid, i - 1, j)
  dfs(grid, i + 1, j)
  dfs(grid, i, j + 1)
  dfs(grid, i, j - 1)
end

grid = [[1,1,0,0,0], [1,1,0,0,0], [0,0,1,0,0], [0, 0, 0,1,1]]
puts num_islands(grid)