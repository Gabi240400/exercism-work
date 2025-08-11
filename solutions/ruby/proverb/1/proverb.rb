class Proverb
  attr_reader :items, :qualifier

  def initialize(*args, qualifier: '')
    @items = [*args]
    @qualifier = qualifier
  end

  def to_s
    i = 0
    proverb = ''
    while i < items.length - 1
      proverb << get_sentence(items[i], items[i + 1])
      i += 1
    end
    proverb << "And all for the want of a "
    if qualifier != ''
      proverb << "#{qualifier} "
    end
    proverb << "#{items[0]}."
  end

  def get_sentence(word1, word2)
    "For want of a #{word1} the #{word2} was lost.\n"
  end
end