require 'yaml'

def ngrams(n, string)
	string.downcase.gsub(/[[:punct:]]/, ' ').gsub(/[0-9]/, ' ').squeeze(' ').gsub(Regexp.union(" "), "_").gsub("\n",'').split("").each_cons(n).to_a
end

languageHash = Hash.new(0)
results = Hash.new(0)
line_num = 0 

text = File.open('testData/' + ARGV[0]).read

text.gsub!(/\r\n?/, "\n")

arr = ngrams(3, text)

arr.each do |word|
  results[word.join("")] += 1
end

Dir.foreach('./models') do |item|
  	next if item == '.' or item == '..'
  	
  	sum = 0;

	model = YAML.load_file('models/' + item)

  	results.each_key do |key|
  		sum += model[key].to_i * results[key]
  	end	

  	languageHash[item.split(".")[0].to_s] = sum
end

languageHash = languageHash.sort_by{|key, value| value}.reverse

puts "\nI think your text is written in " + languageHash.first[0] + '!'
puts 'This is my approximation of compatibility of your text with each of my models (the more points, the better compatibility): ' 

languageHash.each do |key, value|
    puts key + ' : ' + value.to_s
end