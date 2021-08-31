def dijkstra(graph, target)
  source = graph.first
  queue = []
  visited = []

  queue << source

  until queue.empty?
    v = queue.shift
    #binding.pry
    return trace_path(visited, v) if v.position == target
    v.neighbours.each do |u| 
      next if visited.any? { |node| node.position == u }
      
      u = Node.new(u)
      
      sum = v.distance + v.weights[v.neighbours.find_index(u.position)]
      u.distance = sum < u.distance ? sum : u.distance
      
      queue << u
      
    end
    visited << v
    
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