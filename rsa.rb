require 'openssl'

key = OpenSSL::PKey::RSA.new(2048)

puts "\nEncrypt: " 
puts encrypted_string = key.public_encrypt('Very, very confidential data', OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING)

puts "\nDecrypt: "
puts decrypted_string = key.private_decrypt(encrypted_string, OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING)
