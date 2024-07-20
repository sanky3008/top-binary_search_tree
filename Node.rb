class Node
  attr_accessor :left, :right, :data

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def to_s
    puts "Data: #{@data}, Left: #{@left}, Right: #{@right}"
  end
end
