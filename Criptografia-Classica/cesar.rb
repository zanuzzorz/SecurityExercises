cifra = msg_cifrada = msg_decifrada = ''

mensagem = File.open("#{ARGV[0]}",'rb')
chave = "#{ARGV[1]}".to_i

mensagem.each_char { |x|
	cifra = ((x.ord + chave) % 256).chr
	msg_cifrada +=  cifra
}
#puts "\nMensagem cifrada: \n" + msg_cifrada.to_s
print msg_cifrada.to_s

msg_cifrada.each_char { |x|
	cifra = ((x.ord - chave) % 256).chr
	msg_decifrada +=  cifra
}

if ARGV[2] == 'd'
	puts "\nMensagem decifrada: \n" + msg_decifrada.to_s
end
