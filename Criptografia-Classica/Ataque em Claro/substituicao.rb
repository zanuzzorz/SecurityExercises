claro = (File.open("#{ARGV[0]}",'rb')).read
escuro = (File.open("#{ARGV[1]}",'rb')).read

chave = []
for i in 0..(escuro.size-1)
	dict = [(claro[i].ord).chr, (escuro[i].ord).chr]
	chave << dict unless chave.include? dict
end
print chave.sort
