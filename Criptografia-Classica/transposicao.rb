def crypt(mensagem, chave)
	msg_cifrada = Array.new(chave, '')
	mensagem += '¬' until mensagem.size % chave == 0
	mensagem = mensagem.scan(/#{'.' * chave}/)  

	mensagem.size.times { |x|
    	msg_cifrada.size.times { |i|  msg_cifrada[i] += mensagem[x][i] }
 	}	

 	[msg_cifrada].transpose.join('')
end

def decrypt(mensagem, chave)
	tamanho = (mensagem.tr('¬', '').size % chave).to_i

	msg_decifrada = Array.new((mensagem.size / chave), '')
	mensagem = mensagem.scan(/#{'.' * (mensagem.size / chave)}/)  

	mensagem.size.times { |x|
    	msg_decifrada.size.times { |i|  msg_decifrada[i] += mensagem[x][i] }
 	}	

 	[msg_decifrada].transpose.join('')
end

def ajustar_texto(texto)
	texto.tr('¬', '').tr('¢', ' ').tr('£', "\n")
end

mensagem = File.open("#{ARGV[0]}",'rb').read
mensagem = mensagem.tr(' ', '¢').tr("\n", '£')   # Subtitui os espaços em branco e as quebras de linha por simbolos.
chave = "#{ARGV[1]}".to_i


msg_cifrada = crypt(mensagem, chave)
print ajustar_texto(msg_cifrada)

msg_decifrada = decrypt(msg_cifrada, chave)
#print ajustar_texto(msg_decifrada)
