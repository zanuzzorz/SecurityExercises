escuro = File.open("#{ARGV[0]}",'rb').read
words = File.open('words.txt', 'rb').read.split

def decrypt(message, key)
  numCols = (message.size/key.to_f).ceil
  numRows = key
  num = (numCols * numRows)- message.size
  msg_decifrada = [""] * numCols
  row = col = 0
  
  message.each_char { |symbol|
    msg_decifrada[col] += symbol
    col += 1
    if( col==numCols ) || (col == numCols-1 && row >= numRows - num)
      col = 0
      row += 1
    end
  }
  msg_decifrada.join('')
end

part = escuro
for chave in 1..10**6
    msg = decrypt(part, chave)
    lista_palavras = msg.split

    palavras = []
    lista_palavras.each{ |word| palavras << word if words.include? word }

    g = palavras.size > 250 && escuro.size > 5000
    m = palavras.size > 25 && escuro.size > 100 && escuro.size < 5000
    p = palavras.size > 5 && escuro.size < 100

    if p ||  m || g
        File.open('output', 'w').write(msg)
        puts "Chave: #{chave}"
        break
    end
end
