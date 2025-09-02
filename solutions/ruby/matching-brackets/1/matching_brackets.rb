module Brackets
  def self.paired?(phrase)
    stack = []
    phrase.chars.each do |chr|
      if ['(', '{', '['].include?(chr)
        stack << chr
      elsif chr == ')' && stack.last == '(' || chr == ']' && stack.last == '[' || chr == '}' && stack.last == '{'
        stack.pop
      elsif [')', '}', ']'].include?(chr)
        return false
      end
    end
    stack.empty? ? true : false
  end
end
