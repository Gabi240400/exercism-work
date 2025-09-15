class Bst
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(new_data)
    if new_data <= @data
      if @left == nil
        @left = Bst.new(new_data)
      else
        @left.insert(new_data)
      end
    else
      if @right == nil
        @right = Bst.new(new_data)
      else
        @right.insert(new_data)
      end
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    @left.each(&block) if @left
    block.call(data)
    @right.each(&block) if @right
  end
end

