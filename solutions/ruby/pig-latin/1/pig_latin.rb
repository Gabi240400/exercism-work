module PigLatin
  def self.translate(phrase)
    phrase.split.map { |word| translate_word(word) }.join(' ')
  end

  private

  VOWELS = %w[a e i o u]
  LETTERS = ['a'..'z']
  CONSONANTS = LETTERS - VOWELS

  def self.translate_word(word)
    return word + 'ay' if VOWELS.include?(word[0]) || %w[xr yt].include?(word[0..1])
    removed_consonants = ''
    loop do
      if VOWELS.include?(word[0]) || word[0] == 'y' && removed_consonants != ''
        return word + removed_consonants + 'ay'
      end
      return word[2..] + removed_consonants + 'qu' + 'ay' if word[0..1] == 'qu'
      removed_consonants << word[0]
      word = word[1..]
    end
  end
end
