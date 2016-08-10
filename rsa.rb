require 'openssl'

key = OpenSSL::PKey::RSA.new(2048)

puts "\nEncrypt: " 
p encrypted_string = key.public_encrypt('Very, very confidential data', OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING)

puts "\nDecrypt: "
p decrypted_string = key.private_decrypt(encrypted_string, OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING)
