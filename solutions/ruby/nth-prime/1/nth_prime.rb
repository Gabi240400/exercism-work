module Prime
  def self.nth(index)
    raise ArgumentError if index < 1
    return 2 if index == 1

    count = 1
    number = 1
    while count != index
      number += 2
      count += 1 if is_prime?(number)
    end
    number
  end

  private

  def self.is_prime?(number)
    div = 2
    while div * div <= number
      return false if number % div == 0

      div += 1
    end
    true
  end
end
