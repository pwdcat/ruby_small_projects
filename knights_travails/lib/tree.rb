require_relative 'node'

class Tree
  attr_accessor :target, :targetDepth, :results

  def initialize
    reset_state
  end

  def reset_state
    @targetDepth = 6
    @results = []
  end

  MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]].freeze

  def knight_moves(initial, target)
    reset_state
    @target = target
    build_tree(Node.new(initial))
    return combine_moves.reverse unless @results.empty?

    nil
  end

  def build_tree(node, depth = 0)
    return nil if depth > @targetDepth

    if node.position == target
      @targetDepth = depth
      @results << node
      return node
    end

    MOVES.each do |move|
      position = node.position.zip(move).map { |a, b| a + b }

      next unless valid_position?(position)

      child = Node.new(position, node)
      node.children << child
      build_tree(child, depth + 1)
    end
    node
  end

  def combine_moves
    output = []

    node = @results[-1]

    while node.parent
      output << node.position
      node = node.parent
    end
    output << node.position
  end

  def valid_position?(position)
    position.all? { |num| num >= 0 && num < 8 }
  end
end
