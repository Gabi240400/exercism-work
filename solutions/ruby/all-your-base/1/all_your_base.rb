module BaseConverter
  # converts a number from one base to another
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base < 2 || output_base < 2
    if digits.find { |digit| digit < 0 || digit >= input_base }
      raise ArgumentError
    end

    while digits.first == 0
      digits.shift
    end
    return [0] if digits.empty?

    number_in_base_10 = convert_to_base_10(input_base, digits)
    new_number_digits = []
    while number_in_base_10 != 0
      new_number_digits.unshift(number_in_base_10 % output_base)
      number_in_base_10 /= output_base
    end
    new_number_digits
  end

  private

  def self.convert_to_base_10(input_base, digits)
    number_in_base_10 = 0
    count = digits.length - 1
    digits.each do |digit|
      number_in_base_10 += digit * input_base ** count
      count -= 1
    end
    number_in_base_10
  end
end