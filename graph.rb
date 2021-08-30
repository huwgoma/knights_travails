# Graph Class - Store all possible moves of the Knight as nodes in a graph
class Graph
  attr_accessor :nodes

  def initialize(initial_position)
    @nodes = [Node.new(initial_position, 0)]
  end

  def add_node(position)
    @nodes << Node.new(position)
  end
end

module LegalMoveable
  X = [2, 2, -2, -2, 1, -1, 1, -1]
  Y = [1, -1, 1, -1, 2, 2, -2, -2]

  def legal_moves(position)
    legal_moves = []
    X.size.times { |i| legal_moves << Cell.find(position.x + X[i], position.y + Y[i]) }
    legal_moves.compact
  end

end

# Node Class - Class for storing the nodes of the graph
class Node
  include LegalMoveable

  attr_reader :position, :neighbours, :weights
  attr_accessor :distance

  def initialize(position, distance = Float::INFINITY)
    @position = position
    @neighbours = legal_moves(position)
    @distance = distance
    @weights = Array.new(neighbours.size, 1)
  end

end

