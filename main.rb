# LinkedList data type
class LinkedList
  attr_reader :head

  def initialize()
    @head = nil
  end

  def empty?
    return false if @head

    true
  end

  def tail
    curr = @head
    curr = curr.next while curr.next
    curr
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tail.next = Node.new(value)
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tmp = @head
      @head = Node.new(value)
      @head.next = tmp
    end
  end

  def size
    count = 0
    curr = @head
    while curr
      count += 1
      curr = curr.next
    end
    count
  end

  def at(index)
    curr_index = 0
    curr = @head
    while curr_index != index
      curr_index += 1
      curr = curr.next
    end
    curr
  end

  def pop
    curr = @head
    curr = curr.next while curr.next.next
    curr.next = nil
  end

  def contains?(value)
    curr = @head
    loop do
      return true if curr.value == value
      break unless curr.next

      curr = curr.next
    end
    false
  end

  def find(value)
    curr = @head
    index = 0
    loop do
      return index if curr.value == value
      break unless curr.next

      index += 1
      curr = curr.next
    end
    nil
  end

  def to_s
    curr = @head
    string = ''
    until curr.nil?
      string += "( #{curr.value} ) -> "
      curr = curr.next
    end
    "#{string}nil"
  end
end

# Node for LinkedList class
class Node
  attr_accessor :next, :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end

# head = Node.new(0)
# node1 = Node.new(101)
# head.next = node1

# # puts head.value
# # puts head.next.value
# # puts node1.value

list = LinkedList.new
list.append(100)
list.append(101)
list.append(102)
list.append(169)
list.prepend(99)

puts list.head.value
puts list.head.next.value
puts list.head.next.next.value
puts list.head.next.next.next.value
puts list.head.next.next.next.next.value
puts list.tail.value
puts list.at(4).value
puts list.pop
puts list.tail.value
puts list.size
puts list.contains?(102)
puts list.find(102)
puts list.append(169)
puts list.find(169)

puts list
