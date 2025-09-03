module RailFenceCipher
  def self.encode(message, number_of_rows)
    return message if number_of_rows == 1 || message == ''

    m = Array.new(number_of_rows, '')
    number_of_rows.times do |i|
      m[i] = Array.new(message.length, '')
    end
    message_chars = message.chars
    m[0][0] = message_chars.first
    message_chars.shift
    i, j, prev_i = 1, 1, 0
    message_chars.each do |letter|
      m[i][j] = letter
      j += 1
      if prev_i < i && i == number_of_rows - 1 || prev_i > i && i > 0
        prev_i = i
        i -= 1
      else
        prev_i = i
        i += 1  
      end
    end
    encoded_message = ''
    i = 0
    while i < number_of_rows
      j = 0
      while j < message.length
        encoded_message << m[i][j]
        j += 1
      end
      i += 1
    end
    encoded_message
  end

  def self.decode(message, number_of_rows)
    return message if number_of_rows == 1 || message == ''

    m = Array.new(number_of_rows, '')
    number_of_rows.times do |i|
      m[i] = Array.new(message.length, '')
    end
    m[0][0] = 0
    i, j, prev_i = 1, 1, 0
    (message.length - 1).times do
      m[i][j] = 0
      j += 1
      if prev_i < i && i == number_of_rows - 1 || prev_i > i && i > 0
        prev_i = i
        i -= 1
      else
        prev_i = i
        i += 1  
      end
    end
    i = 0
    message_chars = message.chars
    while i < number_of_rows
      j = 0
      while j < message.length
        m[i][j] = message_chars.shift if m[i][j] == 0
        j += 1
      end
      i += 1
    end
    decoded_message = ''
    decoded_message << m[0][0]
    i, j, prev_i = 1, 1, 0
    (message.length - 1).times do
      decoded_message << m[i][j]
      j += 1
      if prev_i < i && i == number_of_rows - 1 || prev_i > i && i > 0
        prev_i = i
        i -= 1
      else
        prev_i = i
        i += 1  
      end
    end
    decoded_message
  end
end
