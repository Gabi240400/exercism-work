=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end

class Anagram
  attr_reader :target
  def initialize(target)
    @target = target
  end

  def match(candidates)
    downcased_target_array = target.downcase.chars # %w[s t o p]
    downcased_candidates = candidates.map { |c| c.downcase.chars }
    anagrams = []
    i = 0
    downcased_candidates.each do |candidate|
      if candidate == downcased_target_array
        i += 1
        next
      end
      anagrams << candidates[i] if candidate.sort == downcased_target_array.sort
      i += 1
    end
    anagrams
  end
end