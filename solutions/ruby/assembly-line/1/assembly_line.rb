class AssemblyLine
  CARS_PER_HOUR_MIN_SPEED = 221
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    total_cars = @speed *  CARS_PER_HOUR_MIN_SPEED
    if @speed < 5
      total_cars
    elsif @speed < 9
      (90 * total_cars).to_f / 100
    elsif @speed == 9
      (80 * total_cars).to_f / 100
    elsif @speed == 10
      (77 * total_cars).to_f / 100
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
