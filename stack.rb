class StackMultiple
  attr_accessor :buffer

  def initialize(number_of_stacks, stack_size)
    @number_of_stacks = number_of_stacks
    @stack_size = stack_size
    @buffer = Array.new(stack_size * number_of_stacks)
    @stack_controller = Hash.new; number_of_stacks.times { |n| @stack_controller[n] = -1 }
  end

  def push(stack_number, value)
    if @stack_controller[stack_number] + 1 > @stack_size
      raise 'Stack is full'
    end

    @stack_controller[stack_number] += 1
    @buffer[(@stack_size * stack_number) + @stack_controller[stack_number]] = value
  end

  def pop(stack_number)
    if @stack_controller[stack_number] == -1
      raise 'Stack is empty'
    end

    element = buffer[stack_number * @stack_size + @stack_controller[stack_number]]
    buffer[stack_number * @stack_size + @stack_controller[stack_number]] = nil

    @stack_controller[stack_number] -= 1

    return element
  end
end

stack = StackMultiple.new(2, 3)
stack.push(0, 3)
stack.push(0, 4)
p stack.buffer
p stack.pop(0)
p stack.buffer
p stack.pop(0)
