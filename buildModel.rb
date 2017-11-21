require 'yaml'
require_relative './lib/ngram.rb'

Dir.foreach('./trainData') do |item|
  	next if item == '.' or item == '..'

  	rawName = item.split(".")[0].to_s
  	results = Hash.new(0)
  	arr = []
	line_num = 0

	if(ARGV.empty?)
		n = 3
	else
		n = ARGV[0].to_i
	end	

	File.readlines('trainData/' + item).each do |line|
		arr = ngrams(n, line)
		arr.each do |word|
			results[word.join("")] += 1
		end
	end

	results = normalizeByOccurance(results)

	File.open('models/' + rawName + '.yml', 'w') { |file| file.write(results.to_yaml) }

	puts 'Build model: ' + rawName
end
