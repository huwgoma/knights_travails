def djikstra(graph, source = graph.first)
  queue = []
  visited = []

  queue << source

  until queue.empty?
    v = queue.pop
    visited << v

    v.neighbours.each do |u| 
      u = Node.new(u)
      
      sum = v.distance + v.weights[v.neighbours.find_index(u.position)]
      u.distance = sum < u.distance ? sum : u.distance
      queue << u unless visited.include?(u)
      binding.pry
    end
  end
end