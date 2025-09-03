module FlowerField
  def self.annotate(input)
    input.map! { |row| row.chars }
    i = 0
    while i < input.length
      j = 0
      while j < input[0].length
        if input[i][j] == ' '
          di = [-1, -0, 1, -1, 1, -1, 0, 1]
          dj = [-1, -1, -1, 0, 0, 1, 1, 1]
          count = 0
          8.times do |index|
            new_i = i + di[index]
            new_j = j + dj[index]
            if new_i < 0 || new_j < 0 || new_i == input.length || new_j == input[0].length
              next
            elsif input[new_i][new_j] == '*'
              count += 1              
            end
          end
          input[i][j] = count if count != 0
        end
        j += 1
      end
      i += 1
    end
    input.map(&:join)
  end
end
