# Language Detector
This is simple a implementation of Language Detector in Ruby. It uses n-grams to build language models, and then approximates compability of input with each model to predict the language.
You can read about the n-grams [here](https://www.sitepoint.com/natural-language-processing-ruby-n-grams/).

# Project
* models - contains models of languages
* trainData - contains corpuses of training data
* testData - file with available inputs
* buildModel.rb - program that builds the model
* detectLanguage.rb - program that detects language of input

# Usage
First, you have to build language models.
```
ruby buildModel.rb
```
Program will automaticly build 3-grams of every language in trainData folder (names of files should be languages names)
You can also run this with an argument to build any n-gram model. For example, to build 4-grams:
```
ruby buildModel.rb 4
```
To detect language in the input text:
```
ruby detectLanguage.rb english.txt
```
Your input text should be located in the testData folder.
Without an extra parameter programm works for 3-grams. To run it for custom n-grams, use:
```
ruby detectLanguage.rb english.txt 4
```