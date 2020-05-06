
# matrix[row][col]

def spiralize(matrix)
  if !matrix or matrix.length == 0
    return []
  end

  output = []
  col_begin = 0
  col_end = matrix[0].size-1
  row_begin = 0
  row_end = matrix.size-1
  mat_size = matrix.size * matrix[0].size

  while col_begin <= col_end and row_begin <= row_end do
    # go right: col_begin to col_end on row_begin, increment row_begin
    for i in col_begin..col_end do
      output.push(matrix[row_begin][i])
    end
    row_begin += 1

    if (output.size == mat_size)
      break
    end

    # go down: row_begin to row_end on col_end, decrement col_end
    for i in row_begin..row_end do
      output.push(matrix[i][col_end])
    end
    col_end -= 1

    if (output.size == mat_size)
      break
    end

    # go left: col_end to col_begin on row_end, decrement row_end
    for i in (col_begin..col_end).reverse_each do
      output.push(matrix[row_end][i])
    end
    row_end -= 1

    if (output.size == mat_size)
      break
    end

    # go up: row_end to row_begin on col_begin, increment col_begin
    for i in (row_end..row_begin).reverse_each do
      output.push(matrix[i][col_begin])
    end
    col_begin += 1
  end

  output
end