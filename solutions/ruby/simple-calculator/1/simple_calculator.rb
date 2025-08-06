class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    begin
    output = "#{first_operand} #{operation} #{second_operand} = "
    case operation
    when '+'
      "#{output}#{first_operand + second_operand}"
    when '/'
      "#{output}#{first_operand / second_operand}"
    when '*'
      "#{output}#{first_operand * second_operand}"
    else
      raise UnsupportedOperation.new
    end
    rescue TypeError
      raise ArgumentError
    rescue ZeroDivisionError
      return 'Division by zero is not allowed.'
    end
  end
end
