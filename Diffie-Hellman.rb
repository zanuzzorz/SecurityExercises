base = 3
mod = 999769

puts "Digite a chave secreta: "
sk = gets.chomp.to_i
puts "\nChave publica: #{(base ** sk) % mod}"

puts "\nDigite a chave intermediaria: "
ik = gets.chomp.to_i
puts "\nResultado: #{(ik ** sk) % mod} \n"