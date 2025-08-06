=begin
Write your code for the 'Two Fer' exercise in this file. Make the tests in
`two_fer_test.rb` pass.
=end
module TwoFer
  def self.two_fer(name = nil)
    if name
      "One for #{name}, one for me."
    else
      'One for you, one for me.'
    end
  end
end
