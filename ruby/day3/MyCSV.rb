#! /usr/bin/ruby

# author: Chris Wood
# date: 01/02/13
# exercise: 7 Languages in 7 Weeks by Bruce Tate
# => Ruby Day 3
# Here I have extended his CSV reader Meta-programming example
# Where there are missing edge cases in this example code, 
# 	I have indicated as such.

module ActsAsCsv
	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end

	class CsvRow
		attr_accessor :contents
		def initialize(contents)
			# need to check that contents is a valid hash
			@contents = contents
		end
		def method_missing name
			# Need to check that name is a valid key in the contents hash
			return @contents[name.to_s]
		end
	end

	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')

			file.each do |row|
				# There are two major facets that this approach does not cover:
				# 1. What if 2 or more headers share the same name?
				# 2. What if there are fields that do not have headers?
				contents = {}
				# Spaces should be optional - greedy regex-based
				data = row.chomp.split(', ')
				i = 0
				@headers.each do |header|
					contents[header] = data[i]
					i = i+1
				end
				@csv_contents << CsvRow.new(contents)
			end
		end

		attr_accessor :headers, :csv_contents
		def initialize
			read
		end
	end
end

class RubyCsv # No inheritance! You can mix it in 
	include ActsAsCsv
	acts_as_csv
end

# Running the Ruby CSV Example
example = RubyCsv.new
example.csv_contents.each do |row|
	puts row.one
end