class Allergies
  attr_reader :score
  
  MAP = {1=>'eggs', 2=>'peanuts', 4=>'shellfish', 8=>'strawberries', 16=>'tomatoes', 32=>'chocolate', 64=>'pollen', 128=>'cats'}

  def initialize(score)
    @score = score
  end

  def floor_log2()
    score_cpy = score
    exp = 0
    while score_cpy >= 2
      exp += 1
      score_cpy >>= 1
    end
    exp
  end

  def allergic_to?(allergen)
    if score <= 0
      return false
    end
    exp = 1 << floor_log2()
    if MAP[exp] == allergen
      return true
    end
    score_cpy = score
    while exp > 0
      if score_cpy - exp >= 0
        score_cpy -= exp
        if MAP[exp] == allergen
          return true
        end
      end
      exp >>= 1
    end
    false
  end

  def list()
    if score <= 0
      return []
    end
    exp = 1 << floor_log2()
    if score == exp
      return [MAP[exp]]
    end
    ret_list = []
    score_cpy = score
    while exp > 0
      if score_cpy - exp >= 0
        score_cpy -= exp
        if MAP[exp] != nil
          ret_list << MAP[exp]
        end
      end
      exp >>= 1
    end
    ret_list.reverse
  end
end