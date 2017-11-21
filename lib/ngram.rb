def ngrams(n, string)
	string.downcase.gsub(/[^\p{Ll}\p{Lu}\p{Lt}\p{Lo}\p{Nd}\p{Pc} ]+/, ' ').gsub(/[0-9]/, ' ').squeeze(' ').gsub(Regexp.union(" "), "_").split("").each_cons(n).to_a
end

def normalizeByOccurance(inputHash)
	sum = 0.0 

	inputHash.each do |key, value|
		sum += inputHash[key]
	end

	inputHash.each do |key, value|
		inputHash[key] = inputHash[key].to_f / sum.to_f
	end

	return inputHash
end