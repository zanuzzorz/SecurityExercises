#mensagem =  "ATACARBASESUL"
mensagem = File.open("#{ARGV[0]}",'rb')

def enumerate(lista_embaralhada)
	lista_embaralhada.map.with_index {|x, i| [i, x] } # Faz uma associação entre uma lista de numeros embaralhados com numeros ordenados de 0 a 255
end

if ARGV[1]
	key =  File.open("#{ARGV[1]}",'rb')
	n_emb = []
	key.each_char{|k| n_emb << (k.chr).ord }
	cifras = enumerate(n_emb)
else
	n = []
	n_emb = (256.times.map{ |i| n[i] = i } ).shuffle    # Cria uma lista de numeros de 0 a 255 e depois embaralha esses numeros (shuffle)
	cifras = enumerate(n_emb)     
end

msg_cifrada = []
mensagem.each_char  { |x|  
	msg_cifrada << (cifras[(x.ord)][1].to_i).chr
}
#puts "Mensagem Cifrada: " + msg_cifrada = msg_cifrada.join('')
msg_cifrada = msg_cifrada.join('')
print msg_cifrada

msg_decifrada = dec = []	
msg_cifrada.each_char { |x|
	cifras.map {|y, z| 
		if cifras[y][1] == x.ord
			dec = cifras[y][0]
		end
	}
	msg_decifrada << (dec).chr 
}

#puts "Mensagem Decifrada: " +  msg_decifrada.join('')
