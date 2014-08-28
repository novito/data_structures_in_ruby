class StackLinkedList
  attr_accessor :head

  def initialize
    @head = nil
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

  private

  class Node
    attr_accessor :next
    attr_accessor :data

    def initialize(value)
      @data = value
      @next = nil
    end
  end
end

ll = StackLinkedList.new
ll.push(3)
ll.push(4)
p ll.pop
ll.push(5)
puts ll.peek
