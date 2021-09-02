def dijkstra(graph, target)
  source = graph.nodes.first
  queue = []
  visited = []

  queue << source

  until queue.empty?
    current = queue.shift
    return trace_path(visited, current) if current.position == target
    current.neighbours.each do |neighbour| 
      next if visited.any? { |node| node.position == neighbour }
      
      neighbour = graph.add_node(neighbour).last
      #dist(current) + weight(current, neighbour) < dist(neighbour) ?
      sum = current.distance + 1
      neighbour.distance = sum < neighbour.distance ? sum : neighbour.distance
      
      queue << neighbour      
    end
    visited << current
    
  end
  
end

def trace_path(visited, target, path = [target])
  return if target.distance == 0
  previous_node = visited.select do |node|
    node.neighbours.include?(target.position)
  end.first
  path.unshift(previous_node)
  trace_path(visited, previous_node, path)
  
  path
end