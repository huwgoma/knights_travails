class Knight
  attr_accessor :position, :target

  def initialize
    @position = Cell.find(1, 0)
  end

  def knight_moves(start, target)
    @position = Cell.find(start.first, start.last)
    @target = Cell.find(target.first, target.last)

    graph = Graph.new(position)
    number_of_moves = dijkstra(graph.nodes, @target)
    binding.pry
    graph.add_node(position)
  end

end
