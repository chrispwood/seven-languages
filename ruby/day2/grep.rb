#! /usr/bin/ruby

# Write a simple grep that will print the lines of a file 
# having any occurrences of a phrase anywhere in that line. 
# You will need to do a simple regular expression match and 
# read lines from a file. (This is surprisingly simple in
# Ruby.) If you want, include line numbers.

class Grep
	attr_accessor :regular_expression, :filenames

	def self.usage()
		$stderr.puts "Usage: grep.rb regex filename(s)"
	end

	def initialize(regular_expression, fileset=[])
		@regular_expression = regular_expression
		@filenames = fileset
		grepFiles()
	end

	def grepFiles()
		@filenames.each do |filename| 
			counter = 1
			File.open(filename,'r').each do |line| 
				puts "#{filename} (#{counter}): #{line}" if line =~ /#{@regular_expression}/
				counter = counter + 1
			end
		end
	end
end 

if __FILE__ == $0
	if ARGV.length < 2 
		usage()
	else
		grep = Grep.new(ARGV[0],ARGV[1..ARGV.length-1])
	end
end