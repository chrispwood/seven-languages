#! /usr/bin/io

# Find:
#  Some Io Example Problems
#		http://sift-io.sourceforge.net/
#		http://en.wikibooks.org/wiki/Io_Programming/Io_Example_Code
#  An Io Community that will answer questions
#		http://stackoverflow.com/questions/tagged/iolanguage
#		http://tech.groups.yahoo.com/group/iolanguage/
#		https://io-fans.jottit.com/
#  A style guide with Io idioms
#		http://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide

# Evaluate 1+1 and 1+"one".  Is Io strongly or weakly typed?
#	A: Io is Strongly typed
"Io is stronly typed" println
typeObj := Object clone
typeObj num := 1
typeObj str := "one"
typeObj num type println
typeObj str type println

# Is 0 true or false? true
"0 is true" println
obj := 0 or false 
obj println
# What about the empty string? true
"empty string is true" println
empty := "" or false
empty println

# How can you tell what slots a protype supports?
"You can tell what slots a prototype slots by calling slotNames on proto" println
Person := Object clone
Person name := "the name field"
Person address := "the address field"
personInstance := Person clone
"Person: " println
personInstance proto slotNames println

# What is the difference between = (equals), := (colon equals), and ::= (colon colon equals)?
"Equals (=) assigns to an existing slot" println
"Colon equals creates a slot if not created and then assigns to the slot" println
# http://stackoverflow.com/questions/5972327/whats-the-difference-between-newslot-and-setslot-in-the-io-language
"Colon colon equals creates a slot, assigns a setter set[Slotname], and assigns the value" println

# Execute the code in a slot given its name
Person = Object clone
Person firstName := method ("The First Name" println)
Person lastName := method ("The Last Name" println)
Person lastName