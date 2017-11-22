#!/bin/bash
function pause 
{
	printf "\n>>> Press enter to continue...\n"
	read
}

function buildModel
{
	printf ">>> Build known models\n"
	ruby ./buildModel.rb 
	pause
}

function checkEngSpa
{
	printf ">>> Detect language for: english.txt\n"
	ruby ./detectLanguage.rb english.txt
	pause

	printf ">>> Detect language for: spanish.txt\n"
	ruby ./detectLanguage.rb spanish.txt
	pause
}

buildModel
checkEngSpa

printf "\n>>> Running scraper to scrap additional language corpuses from wikipedia.\n"
printf "\nWe'll be testing russian and polish input next, so it's good to scrap these corpuses. Still, you are free to scrap any language you like.\n"
printf "\nCommand to scrap language - language name (e.g. 'polish')"
printf "\nCommand to see available corpuses - 'languages'"
printf "\nCommand to exit scraper and continue demo - 'exit'\n\n"
ruby ./wikiScraper.rb 
pause

buildModel

checkEngSpa

printf ">>> Detect language for: russian.txt\n"
ruby ./detectLanguage.rb russian.txt
pause

printf ">>> Detect language for: polish.txt\n"
ruby ./detectLanguage.rb polish.txt

printf "\n>>> End of the demo. Press enter to exit.\n"
read