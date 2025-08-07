module Grid
  def self.saddle_points(tree_matrix)
    result = []
    rows = tree_matrix.length
    columns = tree_matrix[0].length

    i = 0
    while i < rows do
      j = 0
      max_on_row = tree_matrix[i].max
      while j < columns do
        min_on_column = tree_matrix.map { |tm| tm[j] }.min
        if tree_matrix[i][j] == max_on_row && tree_matrix[i][j] == min_on_column
          result << {"row" => i + 1, "column" => j + 1}
        end
        j += 1
      end
      i += 1
    end
    result
  end
end