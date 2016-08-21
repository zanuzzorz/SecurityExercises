mensagem = 'ATACARBASESUL'
chave = 'LIMAO'

BASE = 'A'.ord
SIZE = 'Z'.ord - BASE + 1

def cifrar(texto, chave, dir)
	texto = texto.upcase.gsub(/[^A-Z]/, '')
	msg_chave = chave.upcase.gsub(/[^A-Z]/, '').chars.map{|c| c.ord - BASE}.cycle
	texto.each_char.inject('') do |msg_cifrada, char|
	  offset = msg_chave.next
	  msg_cifrada << ((char.ord - BASE).send(dir, offset) % SIZE + BASE).chr
	end
end
 
msg_cifrada = cifrar(mensagem, chave, :+)
puts "Mensagem cifrada: #{msg_cifrada}"

msg_decifrada  = cifrar(msg_cifrada, chave, :-)
puts "Mensagem decifrada: #{msg_decifrada}"
