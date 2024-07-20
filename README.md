# Binary Search Tree Implementation

This project is part of The Odin Project curriculum and implements a balanced Binary Search Tree (BST) in Ruby.

## Features

- Build a balanced BST from an array
- Insert and delete nodes
- Find a node with a given value
- Traverse the tree in level-order and in-order
- Check if the tree is balanced
- Rebalance the tree

## Files

- `main.rb`: Driver script to demonstrate BST functionality
- `Tree.rb`: Contains the `Tree` class implementation
- `Node.rb`: Contains the `Node` class implementation

## Usage

Run the `main.rb` file to see the BST in action:

```
ruby main.rb
```

This will create a tree, perform various operations, and display the results.

## Key Methods

- `build_tree(arr)`: Builds a balanced BST from an array
- `insert(node)`: Inserts a new node into the tree
- `delete(node)`: Removes a node from the tree
- `find(value)`: Finds and returns a node with the given value
- `level_order`: Traverses the tree in level-order
- `inorder`: Traverses the tree in-order
- `height(node)`: Calculates the height of a given node
- `depth(node)`: Calculates the depth of a given node
- `balanced?`: Checks if the tree is balanced
- `rebalance`: Rebalances the tree

## Learning Outcomes

This project demonstrates understanding of:
- Binary Search Tree data structure
- Tree traversal algorithms
- Balancing algorithms for BSTs
- Ruby programming concepts

Feel free to explore and modify the code to deepen your understanding of BSTs!