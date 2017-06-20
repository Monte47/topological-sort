require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []
  edge_count = 0
  vertices.each do |vertex|
    edge_count += vertex.in_edges.count
    if vertex.in_edges.empty?
      queue << vertex
    end
  end

  return [] if edge_count - vertices.count > 1

  until queue.empty?
    current = queue.shift
    sorted << current
    until current.out_edges.length == 0
      vertex = current.out_edges[0].to_vertex
      current.out_edges[0].destroy!
      if vertex.in_edges.empty?
        queue << vertex
      end
    end
  end
  sorted

end
