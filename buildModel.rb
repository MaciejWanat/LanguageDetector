require 'yaml'

def ngrams(n, string)
  string.downcase.gsub(/[[:punct:]]/, ' ').squeeze(' ').gsub(Regexp.union(" "), "_").gsub("\n",'').split("").each_cons(n).to_a
end

results = Hash.new(0)
line_num = 0

text = File.open('traindata/english.txt').read
text.gsub!(/\r\n?/, "\n")

arr = ngrams(3, text)
#arr = ngrams(3, "raz dwa trzy cztery pięć sześć raz dwa trzy.")
#File.open('clear.txt', 'w') { |file| file.write(text.gsub(/[[:punct:]]/, ' ').squeeze(' ').gsub(Regexp.union(" "), "_").gsub("\n",'')) }

arr.each do |word|
  results[word.join("")] += 1
end


File.open('models/english.yml', 'w') { |file| file.write(results.to_yaml) }

puts results

'''
text.each_line do |line|
  print "#{line_num += 1} #{line}"
end
'''