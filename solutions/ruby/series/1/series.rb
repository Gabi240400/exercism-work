=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end

class Series
  attr_reader :number

  def initialize(number)
    raise ArgumentError if number.empty?

    @number = number
  end

  def slices(new_number_length)
    raise ArgumentError if number.length < new_number_length || new_number_length < 1

    number_of_new_numbers = number.length - new_number_length + 1
    numbers = []
    number_of_new_numbers.times do |index|
      numbers << number.slice(index, new_number_length)
    end
    numbers
  end
end
