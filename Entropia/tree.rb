class Node
  attr_accessor :char, :value, :left, :right
  
  def initialize(char=nil, value)
    @char = char
    @value = value
    @left = nil
    @right = nil
  end

  def search(&block)
    search_node('', &block)
  end

  def search_node(code, &block)
    yield(self, code)
    @left.search_node(code + '0', &block) unless not @left
    @right.search_node(code + '1', &block) unless not @right
  end
end
