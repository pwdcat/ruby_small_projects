class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head
      node = @head
      node = node.next_node while node.next_node
      node.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head
    @head = node
  end

  def size
    count = 0
    node = @head
    while node.next_node
      node = node.next_node
      count += 1
    end
    count
  end

  def tail
    node = @head
    node = node.next_node while node.next_node
  end

  def at(index)
    count = 0
    node = @head
    while count < index
      node = node.next_node
      count += 1
    end
    node
  end

  def pop
    node = @head
    node = node.next_node while node.next_node
    node = nil
  end

  def contains?(value)
    node = @head
    node = node.next_node while node.next_node && node.value != value
    node.value == value
  end

  def find(value)
    count = 0
    node = @head
    while node.next_node && node.value != value
      node = node.next_node
      count += 1
    end
    node.value == value ? count : nil
  end

  def to_s
    node = @head
    while node.next_node
      node = node.next_node
      print "(#{node}) -> "
    end
    print "#{node} - > nil
    "
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, nextNode = nil)
    @nextNode = nextNode
    @value = value
  end
end
