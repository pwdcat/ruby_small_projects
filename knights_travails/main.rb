require_relative 'lib/tree'

test = Tree.new

test.knight_moves([0, 0], [1, 2])
test.knight_moves([0, 0], [3, 3])
test.knight_moves([3, 3], [0, 0])
test.knight_moves([0, 0], [7, 7])
