require 'yaml'
require_relative './lib/ngram.rb'

Dir.foreach('./trainData') do |item|
  	next if item == '.' or item == '..'

  	rawName = item.split(".")[0].to_s
  	results = Hash.new(0)
	line_num = 0

	text = File.open('trainData/' + item).read

	text.gsub!(/\r\n?/, "\n")
	if(ARGV.empty?)
		arr = ngrams(3, text)
	else
		arr = ngrams(ARGV[0].to_i, text)
	end

	arr.each do |word|
	  results[word.join("")] += 1
	end

	File.open('models/' + rawName + '.yml', 'w') { |file| file.write(results.to_yaml) }

	puts 'Build model: ' + rawName
end
