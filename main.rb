require_relative "Node"
require_relative "Tree"

tree = Tree.new()
tree.build_tree((Array.new(15) { rand(1..100) }))

tree.pretty_print

puts tree.balanced?

puts "\n\nLevel Order Printing: \n"
tree.level_order { |node| puts node.data }

puts "\n\nIn Order Printing: \n"
tree.inorder { |node| puts node.data }

tree.insert(Node.new(101))
tree.insert(Node.new(110))
tree.insert(Node.new(105))
tree.insert(Node.new(107))

puts "\n\n Post Insertion:\n"
tree.pretty_print

puts tree.balanced?

puts "rebalancing..."
puts tree.rebalance

tree.pretty_print

puts tree.balanced?

puts "\n\nLevel Order Printing: \n"
tree.level_order { |node| puts node.data }

puts "\n\nIn Order Printing: \n"
tree.inorder { |node| puts node.data }
