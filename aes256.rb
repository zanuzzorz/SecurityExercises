require "openssl"

data = "Very, very confidential data"

cipher = OpenSSL::Cipher::AES.new(256, :CFB)
cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv

encrypted = cipher.update(data) + cipher.final

decipher = OpenSSL::Cipher::AES.new(256, :CFB)
decipher.decrypt
decipher.key = key
decipher.iv = iv

plain = decipher.update(encrypted) + decipher.final

puts data == plain
