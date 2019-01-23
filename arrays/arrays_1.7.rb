def mutate_matrix_rows_columns(a)
  b = []
  for i in 0..(a.size - 1)
    for j in 0..(a[i].size - 1)
      if a[i][j] == 0
        for col in 0..(a[i].size - 1)
          b << [i, col]
        end

        for row in 0..(a.size - 1)
          b << [row, j]
        end
      end
    end
  end

  for i in 0..(b.size - 1)
    row = b[i][0]
    col = b[i][1]
    a[row][col] = 0
  end

  return a
end


a = [[1,0,2], [1, 2, 3], [1, 3, 4]]
print "input #{a} \n"
print "output #{mutate_matrix_rows_columns(a)}"
