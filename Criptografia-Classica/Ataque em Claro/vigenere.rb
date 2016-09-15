claro = (File.open("#{ARGV[0]}",'rb')).read
escuro = (File.open("#{ARGV[1]}",'rb')).read

chave = ''
for i in 0..(escuro.size-1)
	chave << ((escuro[i].ord)-(claro[i].ord)).chr
end
puts chave
