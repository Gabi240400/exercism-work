=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
  attr_reader :matrix

  def initialize(matrix_as_string)
    @matrix = 
      matrix_as_string.split("\n").map { |row| row.split(' ').map(&:to_i) }
    debug "#{matrix}"
  end

  def row(index)
    matrix[index-1]
  end

  def column(index)
    matrix.map { |row| row[index-1] }
  end
end
