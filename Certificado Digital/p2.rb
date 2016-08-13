require 'openssl'
require 'digest'

data 		= 	File.read('data.txt')
hash 		= 	Digest::SHA256.hexdigest data

key 		= 	OpenSSL::PKey::RSA.new(2048)
assinatura 	= 	key.sign(OpenSSL::Digest::SHA256.new, hash)
public_key 	=  	key.public_key

#hash = "Texto invalido"

if public_key.verify(OpenSSL::Digest::SHA256.new, assinatura, hash)
  puts 'Essa Assinatura é Valida!'
else
  puts 'Essa Assinatura é Invalida!'
end