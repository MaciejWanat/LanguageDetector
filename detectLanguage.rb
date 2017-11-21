require 'yaml'
require_relative './lib/ngram.rb'

languageHash = Hash.new(0)
results = Hash.new(0)
line_num = 0 

text = File.open('testData/' + ARGV[0]).read

if(ARGV.length == 1)
	arr = ngrams(3, text)
else
	arr = ngrams(ARGV[1].to_i, text)
end

arr.each do |word|
  results[word.join("")] += 1
end

Dir.foreach('./models') do |item|
  next if item == '.' or item == '..'
  	
  sum = 0;

	model = YAML.load_file('models/' + item)

  	results.each_key do |key|
  		sum += model[key].to_f * results[key].to_f
  	end	

  	languageHash[item.split(".")[0].to_s] = (sum * 10000).round(2)
end

languageHash = languageHash.sort_by{|key, value| value}.reverse

puts "\nI think your text is written in " + languageHash.first[0] + '!'
puts 'This is my approximation of compatibility of your text with each of my models (the more points, the better compatibility): ' 

languageHash.each do |key, value|
  puts key + ' : ' + value.to_s
end