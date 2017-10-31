require 'yaml'

def ngrams(n, string)
	string.downcase.gsub(/[[:punct:]]/, ' ').gsub(/[0-9]/, ' ').squeeze(' ').gsub(Regexp.union(" "), "_").gsub("\n",'').split("").each_cons(n).to_a
end

Dir.foreach('./trainData') do |item|
  	next if item == '.' or item == '..'

  	results = Hash.new(0)
	line_num = 0 

	text = File.open('traindata/' + item).read

	text.gsub!(/\r\n?/, "\n")
	if(ARGV.empty?)
		arr = ngrams(3, text)
	else
		arr = ngrams(ARGV[0].to_i, text)
	end

	arr.each do |word|
	  results[word.join("")] += 1
	end

	File.open('models/' + item.split(".")[0].to_s + '.yml', 'w') { |file| file.write(results.to_yaml) }
end