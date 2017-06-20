class Vertex
  def initialize(value)
    @value = value
    @ins = []
    @outs = []
  end
end

class Edge
  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost
    @from_vertex.ins.push(self)
    @from_vertex.outs.push(self)
  end

  def destroy!

  end
end
