
claro = (File.open("#{ARGV[0]}",'rb').read).tr(' ', '¢').tr("\n", '£') # Subtitui os espaços em branco e as quebras de linha por simbolos.
escuro = (File.open("#{ARGV[1]}",'rb')).read

def crypt(mensagem, chave)
	msg_cifrada = Array.new(chave, '')
	mensagem += '¬' until mensagem.size % chave == 0
	mensagem = mensagem.scan(/#{'.' * chave}/)  

	mensagem.size.times { |x|
    	msg_cifrada.size.times { |i|  msg_cifrada[i] += mensagem[x][i] }
 	}	

 	[msg_cifrada].transpose.join('')
end

part = escuro[0..1000]
for chave in 1..(escuro.size-1)
	msg_cifrada = (crypt(claro, chave)).tr('¬', '').tr('¢', ' ').tr('£', "\n") # Ajusta os espaços em branco e as quebras de linha por simbolos.
	m = msg_cifrada[0..1000]
	puts "Chave: #{chave}" if m == part
	break if m == part
end
