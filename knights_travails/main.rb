require_relative 'lib/tree'

test = Tree.new
test.knight_moves([0, 0], [3, 3])
test.output_moves
