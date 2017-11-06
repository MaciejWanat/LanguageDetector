def ngrams(n, string)
	string.downcase.gsub(/[[:punct:]]/, ' ').gsub(/[0-9]/, ' ').squeeze(' ').gsub(Regexp.union(" "), "_").gsub("\n",'').split("").each_cons(n).to_a
end