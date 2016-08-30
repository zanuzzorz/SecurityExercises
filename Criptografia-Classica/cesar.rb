cifra = msg_cifrada = msg_decifrada = ''

mensagem = File.read('1.input')
chave = 17

mensagem.each_char { |x|
	cifra = ((x.ord + chave) % 256)
	msg_cifrada <<  cifra
}
#puts "\nMensagem cifrada: \n" + msg_cifrada.to_s
print msg_cifrada.to_s

msg_cifrada.each_char { |x|
	cifra = ((x.ord - chave) % 256)
	msg_decifrada <<  cifra
}
#puts "\nMensagem decifrada: \n" + msg_decifrada.to_s
