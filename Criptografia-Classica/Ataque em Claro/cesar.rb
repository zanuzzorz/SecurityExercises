claro = File.open("#{ARGV[0]}",'rb')                    #Texto Original
escuro = File.open("#{ARGV[1]}",'rb')                   #Texto Cifrado 

chave = (escuro.first.ord - claro.first.ord)            #Chave será a diferença entre o 1º caractere de cada texto
puts chave