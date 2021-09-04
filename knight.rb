class Knight
  attr_accessor :position

  def initialize
    @position = Cell.find(1, 0)
  end

  def knight_moves(start, target)
    @position = Cell.find(start.first, start.last)
    target = Cell.find(target.first, target.last)
    graph = Graph.new(position, self.class)
    path = dijkstra(graph, target).map { |node| [node.position.x, node.position.y] }
    "You made it in #{path.size - 1} moves! Here's your path: #{path}"
  end
end
