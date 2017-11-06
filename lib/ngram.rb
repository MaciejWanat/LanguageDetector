def ngrams(n, string)
	string.downcase.tr('²→³−±°@%&↑\{}"[]α·', '').gsub(/[[:punct:]]/, ' ').gsub(/[0-9]/, ' ').squeeze(' ').gsub("\n",'').gsub(Regexp.union(" "), "_").split("").each_cons(n).to_a
	#²→³−±°@%&↑\{\}\"\[\]α·
end