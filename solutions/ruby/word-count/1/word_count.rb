=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end

class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def word_count
    words = phrase.split(/[, \n:!@\$%^&\.]/).reject { |word| word == '' }
    words.map! do |word|
      word = word[1..] if word[0] == "'" || word[0] == '"'
      word = word[..-2] if word[-1] == "'" || word[-1] == '"'
      word
    end.reject! { |word| word == '' }
    word_count = {}
    words.each { |word| word_count[word] ? word_count[word] += 1 : word_count[word] = 1}
    word_count
  end
end
