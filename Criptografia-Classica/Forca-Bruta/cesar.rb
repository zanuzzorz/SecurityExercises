texto = File.open("#{ARGV[0]}",'rb').read
words = File.open('words.txt', 'rb').read.split

for chave in 1..10**6
    decifrado = ''
    palavras = []

	texto.each_char { |c| decifrado += ((c.ord - chave) % 256).chr }
    lista_palavras = decifrado.split

    lista_palavras.each{ |word| palavras << word if words.include? word }
    if palavras.size > 2 || palavras.first == texto
        File.open('output', 'wb').write(decifrado)
        puts chave
		break
    end
end
