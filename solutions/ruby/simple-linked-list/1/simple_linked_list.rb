class Element
  attr_accessor :datum, :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

class SimpleLinkedList
  attr_accessor :first_node

  def initialize(array = nil)
    if array == nil
      @first_node = nil
    else
      array = array.to_a
      while array != []
        self.push(Element.new(array.shift))
      end
    end
  end

  def push(element)
    if @first_node == nil
      @first_node = element
    else
      curr_node = first_node
      while curr_node.next != nil
        curr_node = curr_node.next
      end
      curr_node.next = element
    end
    self
  end

  def to_a
    result = []
    curr_node = @first_node
    while curr_node != nil
      result << curr_node.datum
      curr_node = curr_node.next
    end
    result.reverse
  end

  def pop
    debug "#{self.to_a}"
    return nil if @first_node == nil

    parent = @first_node
    if @first_node.next == nil
      @first_node = nil
      return parent
    else
      child = parent.next
    end
    loop do
      if child.next == nil
        parent.next = nil
        return child
      else
        parent = child
        child = child.next
      end
    end
  end

  def reverse!
    return self if @first_node == nil

    result = []
    curr_node = @first_node
    while curr_node != nil
      result << curr_node
      curr_node = curr_node.next
    end
    result[0].next = nil # to make sure last element of the list will point to nothing
    @first_node = result.pop
    curr_node = @first_node
    while result != []
      curr_node.next = result.pop
      curr_node = curr_node.next
    end
    self
  end
end
