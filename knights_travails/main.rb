require_relative 'lib/tree'

test = Tree.new

p test.knight_moves([0, 0], [1, 2])
p test.knight_moves([0, 0], [3, 3])
p test.knight_moves([3, 3], [0, 0])
p test.knight_moves([0, 0], [7, 7])
