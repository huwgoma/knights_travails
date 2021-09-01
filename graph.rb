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

# Logic for all possible moves of the Knight, given its current Cell position
module KnightMoveable
  X = [2, 2, -2, -2, 1, -1, 1, -1]
  Y = [1, -1, 1, -1, 2, 2, -2, -2]

  def legal_moves(cell)
    legal_moves = []
    X.size.times { |i| legal_moves << Cell.find(cell.x + X[i], cell.y + Y[i]) }
    legal_moves.compact
  end
end

# Node Class - Each Node represents a possible move to a Cell by the Knight:
# Initialize each Node with its position (Cell on the grid), its 
# neighbours (Cells that the Knight may reach in one move), and its
# distance from the Knight's initial position (for use in Dijkstra's Algorithm)
class Node
  include KnightMoveable

  attr_reader :position, :neighbours, :weights
  attr_accessor :distance

  def initialize(position, distance = Float::INFINITY)
    @position = position
    @neighbours = legal_moves(position)
    @distance = distance
  end
end

