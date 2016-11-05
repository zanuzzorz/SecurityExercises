texto_escuro = File.open("#{ARGV[0]}",'rb').read

def frequencia(text)
	h = Hash.new
	text.split("").each {|c| h[c] = text.count(c) if not h.has_key?(c)}
	h =  h.sort_by{|k| k[1]}.reverse
end

def padrao(text, freq)
	padrao_palavras = {}
	# texto = texto.scan /.{256}/
	# texto = texto.split(//)
	
	first = freq.first.first.to_s
	# x = first.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')

	texto =  text.gsub(first, " ")
	texto.split.each { |palavra| 
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

	padrao_palavras
end

puts 'FRREQUÊNCIA'
p f = frequencia(texto_escuro)

puts 'PADRÃO'
p p = padrao(texto_escuro, f)
