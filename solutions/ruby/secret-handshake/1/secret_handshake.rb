class SecretHandshake
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def commands
    return [] unless number.is_a?(Integer)

    result = []
    result << 'wink' if number & (1) != 0
    result << 'double blink' if number & (1 << 1) != 0
    result << 'close your eyes' if number & (1 << 2) != 0
    result << 'jump' if number & (1 << 3) != 0
    result.reverse! if number & (1 << 4) != 0
    result
  end
end
