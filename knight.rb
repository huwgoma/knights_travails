class Knight
  attr_accessor :position

  def initialize
    @position = Cell.find(1, 0)
  end

  def knight_moves(start, target)
    @position = Cell.find(start.first, start.last)
    @target = Cell.find(target.first, target.last)

    graph = Graph.new(position)
    djikstra(graph.nodes)
    binding.pry
    graph.add_node(position)
  end

end
