=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end

module ResistorColorDuo
  def self.get_value_of_color(color)
    case color
    when 'black' then 0
    when 'brown' then 1
    when 'red' then 2
    when 'orange' then 3
    when 'yellow' then 4
    when 'green' then 5
    when 'blue' then 6
    when 'violet' then 7
    when 'grey' then 8
    when 'white' then 9
    end
  end

  def self.value(colors)
    colors
      .map { |color| get_value_of_color(color) }
      .join('')
      .to_i
      .to_s[..1]
      .to_i
  end
end
