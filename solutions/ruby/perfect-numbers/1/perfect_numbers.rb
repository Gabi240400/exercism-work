module PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 1

    aliquot_sum = calculate_aliquot_sum(number)
    if aliquot_sum == number
      'perfect'
    elsif aliquot_sum > number
      'abundant'
    else
      'deficient'
    end
  end

  private

  def self.calculate_aliquot_sum(number)
    div = 2
    divisors = [1]
    while div <= number / 2
      divisors << div if number % div == 0
      div += 1
    end
    divisors.sum
  end
end
