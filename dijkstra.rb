def dijkstra(graph, target)
  source = graph.first
  queue = []
  visited = []

  queue << source

  until queue.empty?
    current = queue.shift
    return trace_path(visited, current) if current.position == target
    current.neighbours.each do |u| 
      next if visited.any? { |node| node.position == u }
      
      u = Node.new(u)
      #dist(v) + weight(u, v) < dist(u) ?
      sum = current.distance + 1
      u.distance = sum < u.distance ? sum : u.distance
      
      queue << u
      
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