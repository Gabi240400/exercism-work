module PythagoreanTriplet
  # Finds all Pythagorean triplets (a, b, c) where a + b + c = N.
  # There is a way to get all primitive triplets. They can all be written
  # using 2 integers m, n, where m > n > 0:
  # a = m * m - n * n
  # b = 2 * m * n
  # c = m * m + n * n
  # It is also known that if (a, b, c) is a Pythagorean triplet,
  # then (ka, kb, kc) is as well
  def self.triplets_with_sum(sum)
    return [] if sum % 2 == 1

    final_solutions = []
    get_all_divisors(sum).each do |divisor|
      new_sum = sum / divisor
      next if new_sum % 2 == 1

      temp_m_n_solutions = []
      get_all_divisors(new_sum / 2).each do |divisor|
        m = divisor
        n = new_sum / 2 / m - m
        if m > n && n > 0
          temp_m_n_solutions << [m, n]
        end
      end
      temp_m_n_solutions.map! do |m_n_solution|
        m = m_n_solution[0]
        n = m_n_solution[1]
        [divisor * (m * m - n * n), divisor * 2 * m * n, divisor * (m * m + n * n)].sort
      end
      final_solutions += temp_m_n_solutions
    end
    final_solutions
      .reject { |sol| sol == [] }
      .uniq
      .sort_by { |sol| sol[0] }
  end

  def self.get_all_divisors(n)
    divisors = [1]
    i = 2
    while i < n / 2
      divisors << i if n % i == 0
      i += 1
    end
    divisors << n
  end
end