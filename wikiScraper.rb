require 'HTTParty'
require 'Nokogiri'
require 'JSON'

def listLanguages(hash)
	puts "\nAvailable languages:" + hash.count.to_s + "\n-----------------------------"
	hash.each do |key, value|
    	puts key
	end
	puts "\n"
end

languagesHash = Hash.new(0)
scrapSource = 'https://en.wikipedia.org/wiki/Earth'

page = HTTParty.get(scrapSource)
parse_page = Nokogiri::HTML(page)

languages = parse_page.at_css('[id="p-lang"]')

languages.to_s.each_line do |line|
	if line =~ /li class=/
		language = /–( [a-zA-Z]+)+"/.match(line).to_s.tr('–','').tr('"','').lstrip.rstrip.downcase
		link = /https?:\/\/[\S]+/.match(line).to_s.tr('"','')
		if (language != '' && link != '')
			languagesHash[language.to_s] = link.to_s
		end
	end
end

languagesHash['english'] = scrapSource

#languagesHash = languagesHash.sort_by{|key, value| key}

exits = false

until exits == true
	puts 'Which language to scrap? Scrap source: ' + scrapSource
	target = gets.to_s.tr("\n",'').downcase
	if(target == 'exit')
		exits = true
	elsif(target == 'languages')
		listLanguages(languagesHash)
	elsif(languagesHash[target] == 0)
		puts "\nCannot find this language.\n"
	else
		page = HTTParty.get(languagesHash[target])
		parse_page = Nokogiri::HTML(page)
		page = parse_page.at_css('[id="mw-content-text"]').text.to_s.gsub("\n", ' ').squeeze(' ')
		
		File.open('trainData/' + target + '.txt', 'w') { |file| file.write(page) }

		puts "\nSaved in trainData/" + target + ".txt!\n\n"

	end	
end