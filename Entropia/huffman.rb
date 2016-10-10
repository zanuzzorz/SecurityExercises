load 'tree.rb'
load 'entropy.rb'

class Huffman
  attr_reader :text, :table, :root

  def initialize(text)
    @text = text
    @root = huffmanTree(text)
    @table = create_table(@text)
  end

  def create_table(text)
    h = frequency(text)
    codes = Hash.new
    @root.search { |node, code| codes[node.char] = code if node.char != nil }
    return codes
  end
  
  def huffmanTree(text)
    arr = Array.new
    h = frequency(text)
    h.each{|k, v| arr.push(Node.new(k, v))}
    while(arr.length > 1)
      arr = arr.sort_by{|k| k.value}.reverse
      a = arr.pop()
      b = arr.pop()
      
      node = Node.new(nil, a.value + b.value)
      node.left = a
      node.right = b
      
      arr.push(node)
    end
    return arr.pop()
  end

  def encode(text=nil)
    if(text == nil)
      text = @text
    end
    ret = ""
    text.split("").each {|c| ret += @table[c] if @table.has_key?(c)}
    return ret
  end

  def decode(bit_string)
    node = @root
    ret = ''
    bit_string.split("").each do |c|
      if c == '1'
        node = node.right
      elsif c == '0'
        node = node.left
      end
      
      if node == nil
        next
      elsif node.char != nil
        ret += node.char
        node = @root
      end
    end
    return ret
  end
  
end

texto =  ARGV[0] ? File.open("#{ARGV[0]}",'rb').read : "texto_de_exemplo"
base  =  ARGV[1] ? "#{ARGV[1]}".to_i : 256

n = Huffman.new(texto)
f = frequency(texto)

puts "Árvore do Texto               = " + n.table.to_s#.gsub(",","\n")
puts "Frequência do Texto           = " + f.to_s
puts "Entropia Texto                = " + entropy(texto, f, base).to_s + "\n\n"

f2 = frequency(n.encode)
puts "Texto Codificado              = " + n.encode
puts "Frequência Texto Codificado   = " + f2.to_s
puts "Entropia Texto Codificado     = " + entropy(n.encode, f2, 2).to_s

# puts "\nTexto Decodificado: " + n.decode(n.encode).to_s
