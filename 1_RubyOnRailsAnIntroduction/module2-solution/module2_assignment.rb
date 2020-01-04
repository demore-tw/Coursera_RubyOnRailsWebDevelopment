#Implement all parts of this assignment within the module2_assignment.rb file

#Implement a class called LineAnalyzer
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content - the string analyzed (provided)
  #* line_number - the line number analyzed (provided)
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  #Add the following methods in the LineAnalyzer class
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result and stores in attributes

  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method
  def initialize (content, line_number)
    @content = content
    @line_number = line_number

    calculate_word_frequency
  end

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within provided content and store that in the highest_wf_count attribute
  #* identify the words that were used the maximum number of times and store that in the highest_wf_words attribute
  def calculate_word_frequency
    wfs = Hash.new(0)
    @content.split.each { |word| wfs[word.downcase] += 1 }

    @highest_wf_count = wfs.values.max
    @highest_wf_words = wfs.select { |key,value| value == @highest_wf_count }.keys
  end
end

#Implement a class called Solution
class Solution
  #Implement the following read-only attributes in the Solution class. The grader will look for accessor methods with these exact names.
  #* analyzers - an array that will hold a LineAnalyzer for each line of the input text file
  #* highest_count_across_lines - a number with the value of the highest frequency of a word
  #* highest_count_words_across_lines - an array of LineAnalyzers with the words with the highest frequency
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  #Implement the following methods in the Solution class
  #* initialize() - initialize the array that will have analyzers for each line of the file
  #* analyze_file() - processes 'test.txt' into an array of LineAnalyzers
  #* calculate_line_with_highest_frequency() - determines which line(s) of text has the highest number of occurrence of a single word
  #* print_highest_word_frequency_across_lines() - prints the word(s) with the highest number of occurrences and its corresponding line number

  #Implement the initialize() method to:
  #* initialize analyzers as an empty array
  def initialize
    @analyzers = []
  end

  #Implement the analyze_file() method to:
  #* read the 'test.txt' file in lines
  #* create an array of LineAnalyzers for each line in the file
  def analyze_file
    line_number = 0
    File.foreach("test.txt") { |line|
      analyzer = LineAnalyzer.new(line, line_number)
      @analyzers.push analyzer

      line_number += 1
    }
  end

  #Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in the analyzers array and store this result in the highest_count_across_lines attribute
  #* identify the LineAnalyzer object(s) in the analyzers array that have the highest_wf_count equal to the highest_count_across_lines attribute value found in the previous step and store them in highest_count_words_across_lines attribute
  def calculate_line_with_highest_frequency
    @highest_count_across_lines = @analyzers.max_by { |analyzer| analyzer.highest_wf_count }.highest_wf_count
    @highest_count_words_across_lines = @analyzers.select { |analyzer| analyzer.highest_wf_count == @highest_count_across_lines }
  end

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the result in the following format
  #* The following words have the highest word frequency per line: 
  #* ["word1"] (appears in line #)
  #* ["word2", "word3"] (appears in line #)
  def print_highest_word_frequency_across_lines
    puts "The following words have the highest word frequency per line:"
    @highest_count_words_across_lines.each { |analyzer| puts "#{analyzer.highest_wf_words} (appears in line #{analyzer.line_number})" }
  end
end
