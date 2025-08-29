module Bob
  def self.hey(phrase)
    if is_question?(phrase) && is_yell?(phrase)
      "Calm down, I know what I'm doing!"
    elsif is_question?(phrase)
      'Sure.'
    elsif is_yell?(phrase)
      'Whoa, chill out!'
    elsif is_silence?(phrase)
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end

  private

  def self.is_question?(phrase)
    phrase.strip.chars.last == '?'
  end

  def self.is_yell?(phrase)
    return false if phrase.count("a-zA-Z") == 0

    phrase.upcase == phrase
  end

  def self.is_silence?(phrase)
    phrase.strip.empty?
  end
end
