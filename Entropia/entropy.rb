def frequency(text)
	h = Hash.new
	text.split("").each {|c| h[c] = text.count(c) if not h.has_key?(c)}
	return h
end

def entropy(text, freq,  base)
	res = 0
	freq.each do |key, value|
		prob = value.to_f / (text.size).to_f
		res += prob * Math.log(prob, base)
	end
	-res
end
