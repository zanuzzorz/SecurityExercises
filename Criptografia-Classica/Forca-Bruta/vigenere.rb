lista = [*('a'..'z'), *('0'..'9')]
texto = File.open("#{ARGV[0]}",'rb').read
words = open('words.txt', 'rb').read.split
comum = [] 
chave = ''

lista.each {|n| lista.each {|l| comum << [l, n]}}
# comum = words

comum.each { |i|

    i.each { |j| chave += j }
    # chave = i

    msg_decifrada = texto.each_byte.zip(chave.each_byte.cycle).map{|p, k| ((p - k ) % 256)}.map(&:chr).join
    lista_palavras = msg_decifrada.split()
    
    palavras = []
    lista_palavras.each{ |word| palavras << word if words.include? word }

    if palavras.size > 50
        File.open('output', 'wb').write(msg_decifrada)
        puts "Chave: #{i}"
        break
    end
}

