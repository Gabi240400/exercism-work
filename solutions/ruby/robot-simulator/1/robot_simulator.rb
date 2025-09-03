class Robot
  attr_accessor :bearing

  NORTH = :north
  SOUTH = :south
  EAST = :east
  WEST = :west

  def initialize
    # @bearing = NORTH # default
  end

  def orient(direction)
    raise ArgumentError unless [NORTH, SOUTH, EAST, WEST].include?(direction)

    @bearing = direction
  end

  def turn_left
    new_direction =
      case bearing
      when NORTH then WEST
      when WEST then SOUTH
      when SOUTH then EAST
      when EAST then NORTH
      end
    @bearing = new_direction
  end

  def turn_right
    new_direction =
      case bearing
      when NORTH then EAST
      when WEST then NORTH
      when SOUTH then WEST
      when EAST then SOUTH
      end
    @bearing = new_direction
  end

  def at(x, y)
    @x = x
    @y = y
  end

  def coordinates
    [@x, @y]
  end

  def advance
    if @bearing == NORTH
      @y += 1
    elsif @bearing == SOUTH
      @y -= 1
    elsif @bearing == EAST
      @x += 1
    elsif @bearing == WEST
      @x -= 1
    end
  end
end

class Simulator
  MAP_INSTRUCTIONS = {'R' => :turn_right, 'L' => :turn_left, 'A' => :advance}

  attr_accessor :robots
  
  def initialize
    @robots = []
  end

  def place(robot, x:, y:, direction:)
    robots << robot
    robot.at(x, y)
    robot.orient(direction)
  end

  def instructions(input)
    input.chars.map { |i| MAP_INSTRUCTIONS[i] }
  end

  def evaluate(robot, input)
    raise ArgumentError unless robots.include?(robot)

    instructions(input).each do |instruction|
      robot.public_send(instruction)
    end
  end
end
