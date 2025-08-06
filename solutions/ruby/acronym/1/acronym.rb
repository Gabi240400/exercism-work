=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end

module Acronym
  def self.abbreviate(str)
    str
      .split(/[\s,-]/)
      .reject { |word| word.empty? }
      .map { |word| word[0].upcase }
      .join
  end
end
