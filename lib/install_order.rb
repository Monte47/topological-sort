# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to
require_relative 'graph'



def install_order(arr)
  p arr
  sorted = []
  queue = []

  arr.each do |vertex|
    p vertex
    if vertex.in_edges.empty?
      queue << vertex
    end
  end


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
