#! /usr/bin/ruby

# Find accessing file with code blocks:
File.open('sample.txt','r').each { |line| puts line }

# Find accessing file without code blocks:
file = File.open('sample.txt','r')
while line = file.gets
	puts line
end
file.close

# flatten method
def Flatten(hash_obj)
	ret_str = '['
	hash_obj.keys.each do |key|
		ret_str = "#{ret_str}#{key}=>#{hash_obj[key]},"
	end
	return "#{ret_str.slice(0,ret_str.length-1)}]"
end

# Translate a hash to an array
hash_obj = { "bob" => 30, "gary" => 23, "sue" => 24 }
array_translated = hash_obj.values
puts "hash to array: [#{array_translated.join(',')}]"
# Translate an array to a hash
hash_translated = {}
array_translated.each_with_index { |val, i| hash_translated[i] = val }
puts "array to hash: #{Flatten(hash_translated)}"

# Print the contents of an array of sixteen numbers, four numbers at a
# time, using just each. Now, do the same with each_slice in Enumerable.
num_array = [
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	12,
	13,
	14,
	15,
	16
]

puts "Print num_array using each"
i = 0
num_array.each do |val|
	if i % 4 == 3
		print "#{val}\n"
	else
		print "#{val}, "
	end
	i = i + 1
end

puts "Print num_array using each_slice"
num_array.each_slice(4) do |arr_sub|
	puts "#{arr_sub[0]}, #{arr_sub[1]}, #{arr_sub[2]}, #{arr_sub[3]}"
end

