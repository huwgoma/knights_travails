# Logic for all possible moves of a chess piece;
# given its current Cell position and its Type
module LegalMoveable
  X = {
    "Knight" => [2, 2, -2, -2, 1, -1, 1, -1]
  }

  Y = {
    "Knight" => [1, -1, 1, -1, 2, 2, -2, -2]
  }

  def legal_moves(cell, piece = Knight)
    x = X[piece.to_s]
    y = Y[piece.to_s]
    legal_moves = []
    x.size.times { |i| legal_moves << Cell.find(cell.x + x[i], cell.y + y[i]) }
    legal_moves.compact
  end  
end

# Graph Class - Store all possible moves of the Knight as nodes in a graph
class Graph
  attr_accessor :nodes, :piece

  def initialize(start, piece)
    @nodes = [Node.new(start, piece, 0)]
    @piece = piece
  end

  def add_node(position)
    @nodes << Node.new(position, piece)
  end
end

# Node Class - Each Node represents a possible move to a Cell by the Knight:
# Initialize each Node with its position (Cell on the grid), its 
# neighbours (Cells that the Knight may reach in one move), and its
# distance from the Knight's initial position (for use in Dijkstra's Algorithm)
class Node
  include LegalMoveable

  attr_reader :position, :neighbours
  attr_accessor :distance

  def initialize(position, piece, distance = Float::INFINITY)
    @position = position
    @neighbours = legal_moves(position, piece)
    @distance = distance
  end
end

