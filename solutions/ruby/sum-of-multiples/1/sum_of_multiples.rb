class SumOfMultiples
  attr_reader :base_values

  def initialize(*base_values)
    @base_values = base_values
  end

  def to(level)
    points = 0
    return 0 if base_values.include?(0)

    (1..level - 1).each do |curr_num|
      if base_values.find { |value| curr_num % value == 0 }
        points += curr_num
      end
    end
    points
  end
end
