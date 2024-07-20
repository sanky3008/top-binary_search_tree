class Tree
  attr_accessor :root

  def build_tree(arr)
    arr = arr.sort.uniq
    # p arr

    if arr == []
      return nil
    elsif arr.length == 1
      return Node.new(arr[0])
    end

    root = Node.new(arr[arr.length/2])
    # puts root

    root.left = self.build_tree(arr[..(arr.length/2 - 1)])
    root.right = self.build_tree(arr[(arr.length/2 + 1)..])

    return @root = root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(node, root = @root)
    if node.data < root.data
      if !root.left
        root.left = node
        return
      end

      self.insert(node, root.left)
    elsif node.data > root.data
      if !root.right
        root.right = node
        return
      end

      self.insert(node, root.right)
    end
  end

  def delete(node, root = @root)

    if root.nil?
      return nil

    elsif node.data > root.data
      root.right = delete(node, root.right)

    elsif node.data < root.data
      root.left = delete(node, root.left)

    elsif node.data == root.data

      if root.left.nil?
        return root.right

      elsif root.right.nil?
        return root.left

      else
        pointer = root.right
        while pointer.left
          pointer = pointer.left
        end

        root.data = pointer.data
        root.right = delete(pointer, root.right)
      end
    end

    root
  end

  def find(value)
    node = Node.new(value)
    root = @root

    while node.data != root.data
      if node.data < root.data
        root = root.left
      elsif node.data > root.data
        root = root.right
      end

      if root.nil?
        puts "Not found"
        return nil
      end
    end

    return root
  end

  def level_order
    root = @root
    queue = Queue.new

    queue << root

    while !queue.empty?
      node = queue.pop
      queue << node.left if !node.left.nil?
      queue << node.right if !node.right.nil?

      yield node
    end
  end

  def inorder(root = @root, &block)

    if !root.nil?
      # puts "left: #{root.left.data}" if root.left
      inorder(root.left, &block)

      # puts "root: #{root.data}" if root
      if block_given?
        block.call(root)
      # else
        # puts root.value
      end

      # puts "right: #{root.right.data}" if root.right
      inorder(root.right, &block)
    end
  end

  def height(node, h = 0)
    node = self.find(node.data)

    if node.left.nil? and node.right.nil?
      # puts "#{node.data} in first loop, #{h}"
      return h
    elsif !node.left.nil? && node.right.nil?
      h += 1
      # puts "#{node.data} in second loop, #{h}"
      h += height(node.left)
    elsif !node.right.nil? && node.left.nil?
      h += 1
      # puts "#{node.data} in second loop, #{h}"
      h += height(node.right)
    else
      h += 1
      # puts "#{node.data} in third loop, #{h}"
      h += [height(node.left), height(node.right)].max
    end
  end

  def depth(node, d = 0, root = @root)
    # puts "#{root.data}, d = #{d}" if root
    # puts "nil root, d = #{d}" if root.nil?

    if root.nil?
      puts "nill root, returning 0!"
      return 0
    elsif root.data == node.data
      puts "#{root.data} returning 1!"
      return d
    end

    d = [depth(node, d + 1, root.left), depth(node, d + 1, root.right)].max

    # puts "#{root.data} returning #{d}!"
    return d
  end

  def balanced?
    return (self.height(@root.left) - self.height(@root.right)).abs <= 1
  end

  def rebalance
    arr = []
    self.inorder { |node| arr << node.data }

    p arr
    puts "\n\n"
    self.build_tree(arr)
  end
end
