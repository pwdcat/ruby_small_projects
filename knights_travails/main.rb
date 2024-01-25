require_relative 'lib/tree'

randomNumbers = Array.new(15) { rand(1..100) }

tree = Tree.new(randomNumbers)
randomNumbers.each { |value| tree.insert(value) }

puts "Random Numbers: #{randomNumbers}"
puts "Height of the Tree: #{tree.height}"

p tree.balanced?

tree.pretty_print

tree.level_order
print "\n"
p tree.preorder
p tree.postorder
p tree.inorder

randomNumbers = Array.new(15) { rand(100..999) }

randomNumbers.each { |value| tree.insert(value) }

tree.pretty_print

p tree.balanced?

tree.rebalance

tree.pretty_print

tree.level_order
print "\n"
p tree.preorder
p tree.postorder
p tree.inorder
