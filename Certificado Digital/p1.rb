require 'openssl'
require 'digest'

IO.copy_stream('data.txt', 'out.txt')

data 		= 	File.read('data.txt')
hash 		= 	Digest::SHA256.hexdigest data

key 		= 	OpenSSL::PKey::RSA.new(2048)
assinatura 	= 	key.sign(OpenSSL::Digest::SHA256.new, hash)
public_key 	=  	key.public_key

open("out.txt", "a") do |file|  
	file << "\n#{hash}" 
	file << "\n#{assinatura}" 
	file << "\n#{public_key}" 
end