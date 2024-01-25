require_relative 'node'

class Tree
  attr_accessor :target, :results

  def initialize
    @targetDepth = 6
  end

  MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]].freeze

  def knight_moves(inital, target)
    @target = target
    @results = []
    build_tree(Node.new(inital))
  end

  def build_tree(node, depth = 0)
    return nil if depth > @targetDepth

    if node.position == target
      @targetDepth = depth
      @results << node
    end

    MOVES.each do |move|
      position = node.position.zip(move).map { |a, b| a + b }

      next unless position.all? { |num| num.positive? && num < 8 }

      child = Node.new(position, node)
      node.children << child
      build_tree(child, depth + 1)
    end
    node
  end

  def output_moves
    node = @results[-1]
    p node.position
    while node.parent
      node = node.parent
      p node.position
    end
  end
end

test = Tree.new
test.knight_moves([0, 0], [3, 3])
test.output_moves
