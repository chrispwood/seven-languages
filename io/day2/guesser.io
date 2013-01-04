#! /usr/bin/io

num := Random value(100) ceil

numTries := 10

while(numTries>0,
	writeln("Please enter your guess in ",numTries," tries:")
	line := File standardInput readLine()

	lineAsNumber := line asNumber
	
	if(lineAsNumber == num,
		writeln("You guessed correctly!")
		return
	)
	if(lineAsNumber > num,
		writeln("The number is less than your guess"),
		writeln("The number is greater than your guess")
	)
	numTries = numTries - 1
)
