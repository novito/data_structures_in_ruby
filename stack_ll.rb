class StackLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def is_empty?
    @head.nil? ? true : false
  end

  def push(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
  end

  def pop
    raise 'Empty list' if @head.nil?
    data_to_return = @head.data
    @head = @head.next

    return data_to_return
  end

  def peek
    raise 'Stack with no elements' if @head.nil?
    return @head.data
  end

end

class Node
    attr_accessor :next
    attr_accessor :data

    def initialize(value)
      @data = value
      @next = nil
    end
  end

class StackWithMin < StackLinkedList
  def initialize
    @min_controller = StackLinkedList.new
    super()
  end

  def push(value)
    new_node = Node.new(value)

    if value <= min
      @min_controller.push(value)
    end

    super(value)
  end

  def pop
    value = super.pop
    if (value == min)
      @min_controller.pop
    end

    return value
  end

  def min
    if is_empty?
      return Float::INFINITY
    else
      return @min_controller.peek
    end
  end
end

min_stack = StackWithMin.new

min_stack.push(3)
min_stack.push(10)
min_stack.push(5)
puts min_stack.min


