texto =  ARGV[0] ? File.open("#{ARGV[0]}",'rb').read : "texto_de_exemplo"
base  =  ARGV[1] ? "#{ARGV[1]}".to_i : 256

freq = {}
texto.each_char  { |c| 
	x = texto.count c
	freq.update({c => x})
}
puts "Frequencia: #{freq}"

res = 0
freq.each do |key, value|
	prob = value.to_f / (texto.size).to_f
	res += prob * Math.log(prob, base)
end
puts "Entropia: #{-res}"
