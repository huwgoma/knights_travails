class Knight
  attr_accessor :position, :target

  def initialize
    @position = Cell.find(1, 0)
  end

  def knight_moves(start, target)
    @position = Cell.find(start.first, start.last)
    @target = Cell.find(target.first, target.last)

    graph = Graph.new(position)
    path = dijkstra(graph.nodes, @target)
    path = path.map do |node|
      [node.position.x, node.position.y]
    end
    binding.pry
    
  end

end
