class Allergies
  attr_reader :allergy_list

  MAP = {1=>'eggs', 2=>'peanuts', 4=>'shellfish', 8=>'strawberries', 16=>'tomatoes', 32=>'chocolate', 64=>'pollen', 128=>'cats'}

  def initialize(score)
    @allergy_list = get_list(score)
  end

  def allergic_to?(allergen)
    allergy_list.include?(allergen)
  end

  def list
    allergy_list.reverse
  end

  private

  def get_list(score)
    arr = []
    score_cpy = score
    exp = 0
    while score_cpy >= 2
      exp += 1
      score_cpy >>= 1
    end
    exp = 1 << exp
    while exp > 0
      if score - exp >= 0
        score -= exp
        if MAP[exp] != nil
          arr << MAP[exp]
        end
      end
      exp >>= 1
    end
    arr
  end
end