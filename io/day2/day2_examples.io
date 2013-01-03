#! /usr/bin/io

# To create an infinite loop, uncomment the following code:
# loop("infinite loop..." println)

# Demonstrating loops:
"\nLoops" println
i := 1
# note: these are two separate commands on a single line
while(i <= 11, i println; i = i + 1); "This one goes up to 11" println
for(i, 1, 11, i println); "This one goes up to 11" println

# this has an increment option (here 2)
for(i, 1, 11, 2, i println); "This one goes up to 11" println

# Note that optional parameters can bite you:
"\nDangers of Optional Parameters" println
for(i, 1, 2, 1, i println, "extra argument") # correct
for(i, 1, 2, i println, "extra argument") # incorrect
# the second for loop treated `i println` as the increment - in this case i

# Conditionals
"\nConditionals" println
if(true, "It is true." println, "It is false." println)
if(false) then("It is true") else ("It is false") println
#if(false) then("It is true." println) else("It is false." println)

# Operators
"\nOperators" println
# To see the list of operators, run the following code:
# OperatorTable println
# Defining xor operator
OperatorTable addOperator("xor", 11)
# OperatorTable println
true xor := method(bool, if(bool, false, true))
false xor := method(bool, if(bool, true, false))

true xor true println
true xor false println
false xor true println
false xor false println

# Messages
"\nExamining Messages" println
postOffice := Object clone
postOffice packageSender := method(call sender)
postOffice messageTarget := method(call target)
postOffice messageArgs := method(call message arguments)
postOffice messageName := method(call message name)
mailer := Object clone
mailer deliver := method(postOffice packageSender)

mailer deliver println
postOffice messageTarget println

postOffice messageArgs("one", 2, :three) println
postOffice messageName println

# Here's a great messaging example implementing unless:
unless := method(
	(call sender doMessage(call message argAt(0))) ifFalse(
	call sender doMessage(call message argAt(1))) ifTrue(
	call sender doMessage(call message argAt(2)))
)
unless(1 == 2, write("One is not two\n"), write("one is two\n"))

# Reflection
"\nExamining Reflection" println
Object ancestors := method(
	prototype := self proto
	if(prototype != Object,
	writeln("Slots of ", prototype type, "\n----------------")
	prototype slotNames foreach(slotName,writeln(slotName))
	writeln
	prototype ancestors))
Animal := Object clone
Animal speak := method(
	"ambiguous animal noise" println)
Duck := Animal clone
Duck speak := method("quack" println)
Duck walk := method(
	"waddle" println)
disco := Duck clone
disco ancestors