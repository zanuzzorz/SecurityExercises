palavras = ARGV[0] ? File.open("#{ARGV[0]}",'rb').read.split : ['bola', 'bala', 'casa', 'rosa', 'faca', 'fofa', 'fofo']
padrao_palavras = {}

palavras.each { |palavra| 
	cont = 0
	padrao = ''
	padrao_palavra = {}

	palavra.each_char{|c| 
		if cont == 0
			padrao_palavra.store(c, cont)
			padrao += cont.to_s
			cont += 1
		elsif padrao_palavra[c] == nil
			padrao_palavra.store(c, cont)
			padrao += cont.to_s
			cont += 1
		else
			padrao += padrao_palavra[c].to_s
		end
	}
	padrao_palavras.update({palavra => padrao})
}

puts padrao_palavras
