#! /usr/bin/io

# 3. Write a program to add up all of the numbers in a two-dimensional array.

# Create the 2 dimensional array
matrix := list(
	list(3, 6, 9, 12),
	list(1, 2, 3, 4),
	list(2, 4, 6, 8),
	list(2, 4, 8, 16),
	list(32, 64, 128, 256)
)

"Total is: 570" println

computedTotal := 0
matrix foreach(outer_i, outer_v, (
	outer_v foreach(inner_i, inner_v, (
		computedTotal = computedTotal + inner_v
	))
))

writeln("Computed total is: ", computedTotal)

# 4. Add a slot call myAverage to a list that computes the average of all the 
# numbers in a list. What happens if there are no numbers in a list?
# (Bonus: Raise an Io exception if any item in the list is not a number)

List setSlot("myAverage",method(
	count := 0
	sum := 0

	self foreach(i,v,(
		if((v type) != "Number",Exception raise("InvalidItemException","Invalid list item - expected Number in myAverage"))
		count = count + 1
		sum = sum + v
	))

	if(count==0, return 0, return sum/count)
))
# This statement fails because it contains a list of lists:
# matrix myAverage()
list() myAverage() println
list(1,2,3,4) myAverage() println
