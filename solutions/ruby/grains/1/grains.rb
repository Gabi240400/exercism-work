module Grains
  def self.square(final_square) 
    raise ArgumentError if final_square < 1 || final_square > 64

    curr_grains_on_square = 1
    curr_square = 1
    while curr_square <= final_square
      curr_square += 1
      curr_grains_on_square *= 2
    end
    curr_grains_on_square / 2
  end

  def self.total
    sum = 0
    (1..64).each do |index|
      sum += square(index)
    end
    sum
  end
end
