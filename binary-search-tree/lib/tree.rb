require_relative 'node'

class Tree
  attr_accessor :root, :data

  def initialize(array)
    @data = array.sort.uniq
    @root = build_tree(data)
  end

  def build_tree(array)
    return nil if array.empty?

    midpoint = array.size / 2
    node = Node.new(array[midpoint])
    node.left = build_tree(array[0...midpoint])
    node.right = build_tree(array[midpoint + 1..])
    node
  end

  def insert(data, node = @root)
    return nil if data == node.data

    case data <=> node.data
    when -1
      node.left.nil? ? node.left = Node.new(data) : insert(data, node.left)
    when 1
      node.right.nil? ? node.right = Node.new(data) : insert(data, node.right)
    end
  end

  def delete(data, node = @root)
    return nil if node.nil?

    case data <=> node.data
    when -1
      left = node.left
      !left.nil? && left.data == data ? node.left = fixDelete(left) : delete(data, left)
    when 1
      right = node.right
      !right.nil? && right.data == data ? node.right = fixDelete(right) : delete(data, right)
    end
  end

  def fixDelete(node)
    return node.right if node.left.nil?
    return node.left if node.right.nil?

    currentNode = node
    node = node.right
    node = node.left while node.left
    currentNode.data = node.data
    delete(node.data, currentNode.right)
    currentNode
  end

  def find(data, node = @root)
    return nil if node.nil?

    case data <=> node.data
    when -1
      left = node.left
      left.nil? ? nil : find(data, left)
    when 1
      right = node.right
      right.nil? ? nil : find(data, right)
    when 0
      node
    end
  end

  def level_order(node = @root, queue = [])
    return nil if node.nil?

    print(" #{node.data} ") unless node.data.nil?

    queue.push(node.left) unless node.left.nil?
    queue.push(node.right) unless node.right.nil?

    level_order(queue.shift, queue)
  end

  def inorder(node = @root, &block)
    return nil if node.nil?

    array = []
    array << inorder(node.left, &block)
    block_given? ? yield(node) : array << node.data
    array << inorder(node.right, &block)
    array.flatten.compact
  end

  def preorder(node = @root, &block)
    return nil if node.nil?

    array = []
    block_given? ? yield(node) : array << node.data
    array << preorder(node.left, &block)
    array << preorder(node.right, &block)
    array.flatten.compact
  end

  def postorder(node = @root, &block)
    return nil if node.nil?

    array = []
    array << postorder(node.left, &block)
    array << postorder(node.right, &block)
    block_given? ? yield(node) : array << node.data
    array.flatten.compact
  end

  def height(node = @root)
    return -1 if node.nil?

    leftHeight = height(node.left)
    rightHeight = height(node.right)

    [leftHeight, rightHeight].max + 1
  end

  def depth(data, node = @root, count = 0)
    return nil if node.nil?

    case data <=> node.data
    when -1
      left = node.left
      return count + 1 if !left.nil? && left.data == data

      depth(data, left, count + 1)

    when 1
      right = node.right
      return count + 1 if !right.nil? && right.data == data

      depth(data, right, count + 1)
    else
      count
    end
  end

  def balanced?
    (height(@root.left) - height(@root.right)).abs < 1
  end

  def rebalance
    @data = inorder
    @root = build_tree(data)
  end

  def pretty_print(node = @root, prefix = '', isLeft = true)
    pretty_print(node.right, "#{prefix}#{isLeft ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{isLeft ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{isLeft ? '    ' : '│   '}", true) if node.left
  end
end
