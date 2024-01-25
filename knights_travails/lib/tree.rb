require_relative 'node'

class Tree
  attr_accessor :target

  def initialize
    @target_depth = 6
  end

  MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]].freeze

  def knight_moves(inital, target)
    @target = target
    build_tree(Node.new(inital))
  end

  def build_tree(node, depth = 0)
    nil if depth == target_depth

    MOVES.each do |move|
      posiiton = node.position.zip(move).map { |a, b| a + b }
      child = Node.new(posiiton, node)
      node.children << child
    end
  end
end
