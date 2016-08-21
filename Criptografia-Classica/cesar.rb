cifra = msg_cifrada = msg_decifrada = ''
mensagem = "Very, very confidential data"
chave = 7

mensagem.each_char { |x|
	cifra = ((x.ord + chave) % 256).chr
	msg_cifrada +=  cifra
}
puts "\nMensagem cifrada: \n" + msg_cifrada.to_s

msg_cifrada.each_char { |x|
	cifra = ((x.ord - chave) % 256).chr
	msg_decifrada +=  cifra
}
puts "\nMensagem decifrada: \n" + msg_decifrada.to_s
