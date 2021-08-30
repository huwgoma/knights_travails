def dijkstra(graph, target)
  source = graph.first
  queue = []
  visited = []

  queue << source

  until queue.empty?
    v = queue.shift
    return v.distance if v.position == target
    v.neighbours.each do |u| 
      u = Node.new(u)
      
      sum = v.distance + v.weights[v.neighbours.find_index(u.position)]
      u.distance = sum < u.distance ? sum : u.distance
      queue << u unless visited.include?(u.position)
      
    end
    visited << v.position
    
  end
  
end