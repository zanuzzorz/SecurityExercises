claro = (File.open("#{ARGV[0]}",'rb')).read
escuro = (File.open("#{ARGV[1]}",'rb')).read

chave = []
for i in 0..(escuro.size-1)
	dict = [(claro[i].ord), (escuro[i].ord)]
	chave << dict unless chave.include? dict
end
p chave.sort
