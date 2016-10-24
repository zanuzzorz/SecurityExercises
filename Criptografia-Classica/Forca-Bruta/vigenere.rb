lista = [*('a'..'z'), *('0'..'9')]
alfabeto = [*('a'..'z')]
numeros = [*('0'..'9')]
texto = File.open("#{ARGV[0]}",'rb').read
words = open('words.txt', 'rb').read.split
comum = [] 
chave = ''

alfabeto.each {|n| comum << [n]}
numeros.each {|n| comum << [n]}
alfabeto.each {|n| alfabeto.each {|l| comum << [l, n]}}
numeros.each {|n| numeros.each {|l| comum << [l, n]}}
alfabeto.each {|n| numeros.each {|l| comum << [l, n]}}
lista.each {|n| comum << [n]}
lista.each {|n| lista.each {|l| comum << [l, n]}}

comum.each { |i|
    i.each { |j| chave += j }

    msg_decifrada = texto.each_byte.zip(chave.each_byte.cycle).map{|p, k| ((p - k ) % 256)}.map(&:chr).join
    lista_palavras = msg_decifrada.split()
    
    palavras = []
    lista_palavras.each{ |word| palavras << word if words.include? word }

    gg  = palavras.size > 999 && texto.size > 50000
    g   = palavras.size > 250 && texto.size > 5000 && texto.size < 50000
    m   = palavras.size > 25  && texto.size > 100  && texto.size < 5000
    p   = palavras.size > 5   && texto.size > 10  && texto.size < 100
    pp  = palavras.size > 2   && texto.size < 10
    ig  =  palavras.size == texto.size

    if pp || p ||  m || g || gg || ig
        File.open('output', 'wb').write(msg_decifrada)
        puts "Chave: #{i}"
        break
    end
}
