# mensagem = 'ATACARBASESUL'
mensagem = File.open("#{ARGV[0]}",'rb')
chave = "#{ARGV[1]}"

def vig_enc(msg, key)
  msg.each_byte.zip(key.each_byte.cycle).map{|p, k| ((p + k ) % 256)}.map(&:chr).join
end

def vig_dec(msg, key)
  msg.each_byte.zip(key.each_byte.cycle).map{|p, k| ((p - k ) % 256)}.map(&:chr).join
end

# msg_cifrada = cifrar(mensagem, chave, :+)
# puts "Mensagem cifrada: #{msg_cifrada}"
msg_cifrada = vig_enc(mensagem, chave)
print msg_cifrada

if ARGV[2] == 'd'
	msg_decifrada  = vig_dec(msg_cifrada, chave)
	puts "Mensagem decifrada: #{msg_decifrada}"
end
