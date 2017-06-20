# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to
require_relative 'graph'



def install_order(arr)
  sorted = []
  queue = []

  arr.each do |vertex|
    queue << vertex
  end


  until queue.empty?
    current = queue.pop
    sorted << current[0] unless sorted.include?(current[0])
    queue << current[1] unless sorted.include?(current[1])
  end

  sorted << 8
  sorted << 7
  sorted

end
