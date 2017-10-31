# Language Detector
This is simple implementation of Language Detector in Ruby. It uses n-grams to build language models, and then approximates compability of input with each model to predict the language.
You can read about the n-grams [here](https://www.sitepoint.com/natural-language-processing-ruby-n-grams/)

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

To detect language in the input text use
```
ruby detectLanguage.rb english.txt
```
Your input text should be located in the testData folder.