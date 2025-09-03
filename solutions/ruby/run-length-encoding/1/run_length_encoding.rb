module RunLengthEncoding
  def self.encode(input)
    encoded = ''
    while input != ''
      letter = input[0]
      i, count = 1, 1
      while input[i] == letter
        count += 1
        i += 1
      end
      if count == 1
        encoded << letter
      else
        encoded << "#{count}#{letter}"
      end
      input = input[count..]
    end
    encoded
  end

  def self.decode(input)
    decoded = ""
    while input != ''
      if input.to_i > 0 && input[0] != ' '
        number = input.to_i
        input = input[number.to_s.length..]
        number.times { decoded << input[0] }
        input = input[1..]
      else
        decoded << input[0]
        input = input[1..]
      end
    end
    decoded
  end
end
