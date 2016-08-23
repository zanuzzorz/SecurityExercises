ALFABETO = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
@tamanho = ALFABETO.size

def crypt(mensagem, chave)
  msg_cifrada = Array.new(chave.size, '')
  mensagem += 'X' until mensagem.size % chave.size == 0           
  mensagem = mensagem.scan(/#{'.' * chave.size}/)                 

  mensagem.size.times { |x|
    msg_cifrada.size.times { |i| msg_cifrada[i] += mensagem[x][i] }
  }

  chave_indexes = []
  chave.size.times { |x| chave_indexes << ALFABETO.index(chave[x]) }
  chaves_selecionadas = Array.new(chave.size)

  chave.size.times { |x|
    chaves_selecionadas[chave_indexes.index(chave_indexes.min)] = x
    chave_indexes[chave_indexes.index(chave_indexes.min)] = (@tamanho + 1)
  }

  rearranged_msg_cifrada = Array.new(chave.size)
  chave.size.times { |x| rearranged_msg_cifrada[chaves_selecionadas[x]] = msg_cifrada[x] }
  msg_cifrada = rearranged_msg_cifrada.join('')

  print "Mensagem cifrada: \n"
  msg_cifrada
end

def decrypt(mensagem, chave)
  return 'Mensagem cifrada eh Invalida!' if mensagem.size % chave.size != 0

  msg_decifrada = Array.new((mensagem.size / chave.size), '')
  mensagem = mensagem.scan(/#{'.' * (mensagem.size / chave.size)}/)

  chave_indexes = []
  chave.size.times { |x| chave_indexes << ALFABETO.index(chave[x]) }
  chaves_selecionadas = Array.new(chave.size)

  chave.size.times { |x|
    chaves_selecionadas[chave_indexes.index(chave_indexes.min)] = x
    chave_indexes[chave_indexes.index(chave_indexes.min)] = (@tamanho + 1)
  }

  rearranged_mensagem = Array.new(chave.size)
  chave.size.times { |x| rearranged_mensagem[x] = mensagem[chaves_selecionadas[x]] }
  mensagem = rearranged_mensagem

  msg_decifrada.size.times { |x| mensagem.size.times { |i| msg_decifrada[x] += mensagem[i][x] } }

  msg_decifrada = msg_decifrada.join('')                  
  msg_decifrada.slice! -1 while msg_decifrada[-1] == 'X'  
  msg_decifrada.capitalize!                               

  puts "\nMensagem decifrada: \n"
  msg_decifrada
end

mensagem = 'ATACARBASESUL'
chave = 'LIMAO'

puts msg_cifrada = crypt(mensagem, chave)
puts decrypt(msg_cifrada, chave).upcase
