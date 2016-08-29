def crypt(mensagem, chave)
	msg_cifrada = Array.new(chave, '')
	mensagem += '#' until mensagem.size % chave == 0
	mensagem = mensagem.scan(/#{'.' * chave}/)  

	mensagem.size.times { |x|
    	msg_cifrada.size.times { |i|  msg_cifrada[i] += mensagem[x][i] }
 	}	

 	[msg_cifrada].transpose.join('')
end

def decrypt(mensagem, chave)
	tamanho = (mensagem.tr('#', '').size % chave).to_i

	msg_decifrada = Array.new((mensagem.size / chave), '')
	mensagem = mensagem.scan(/#{'.' * (mensagem.size / chave)}/)  

	mensagem.size.times { |x|
    	msg_decifrada.size.times { |i|  msg_decifrada[i] += mensagem[x][i] }
 	}	

 	[msg_decifrada].transpose.join('').tr('#', '').tr('&', ' ')
end

mensagem = 'Very, very confidential data'
chave = 3

puts msg_cifrada = crypt(mensagem.tr(' ', '&'), chave)
puts decrypt(msg_cifrada, chave)
