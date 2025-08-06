class SpiralMatrix
  attr_reader :dim

  def initialize(dim)
    @dim = dim
  end

  def matrix
    result = Array.new(dim) { Array.new(dim) { 0 } }
    action = 'R'
    curr_num = 1
    i, j = 0, 0
    while curr_num <= dim * dim
      result[i][j] = curr_num
      curr_num += 1
      
      case action
      when 'R' then j += 1
      when 'D' then i += 1
      when 'L' then j -= 1
      when 'U' then i -= 1
      end

      if action == 'R'
        if j == dim || result[i][j] > 0
          j -= 1
          i += 1
          action = next_action(action)
        end
      elsif action == 'D'
        if i == dim || result[i][j] > 0
          i -= 1
          j -= 1
          action = next_action(action)
        end
      elsif action == 'L'
        if j < 0 || result[i][j] > 0
          j += 1
          i -= 1
          action = next_action(action)
        end
      elsif action == 'U'
        if i < 0 || result[i][j] > 0
          i += 1
          j += 1
          action = next_action(action)
        end
      end
    end
    result
  end

  def next_action(keyword)
    case keyword
    when 'R' then 'D'
    when 'D' then 'L'
    when 'L' then 'U'
    when 'U' then 'R'
    end
  end  
end
