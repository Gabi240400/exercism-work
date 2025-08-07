module Transpose
  def self.transpose(string_matrix)
    return '' if string_matrix == '' # handling empty matrix

    matrix = string_matrix.split("\n").map(&:chars)
    matrix.max { |line| line.length }
    num_of_lines = matrix.length
    num_of_columns = matrix.max { |a, b| a.length <=> b.length }.length
    index = 0
    matrix.each do |line|
      if line.length == num_of_columns
        index += 1
      else
        current_empty_position = line.length
        while current_empty_position < num_of_columns
          line[current_empty_position] = nil # make all lines have the same length by adding nil at the end
          current_empty_position += 1
        end
        index += 1
      end
    end
    
    # creating the transposed matrix
    i, j = 0, 0
    result = Array.new(num_of_columns) { Array.new(num_of_lines) { 0 } }
    while i < num_of_lines
      j = 0
      while j < num_of_columns
        result[j][i] = matrix[i][j]
        j += 1
      end
      i += 1
    end

    # handling on nil values 
    result.each do |line|
      # replace nil from the right with empty string
      i = num_of_lines - 1
      while i >= 0
        if line[i] == nil
          line[i] = ''
          i -= 1
        else
          break
        end
      end

      # transform remaining nil into space
      i = 0
      while i < num_of_lines
        if line[i] == nil
          line[i] = ' '
        end
        i += 1
      end
    end
    result.map(&:join).join("\n")
  end
end
