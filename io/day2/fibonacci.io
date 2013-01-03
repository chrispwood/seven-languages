#! /usr/bin/io

# 1. A Fibonacci sequence starts with two 1s. Each subsequent number is the sum of
# the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a
# program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.

Object fibonacci := method(sequenceNumber,
	if(sequenceNumber<3, 
		return 1, 
		return fibonacci(sequenceNumber-1) + fibonacci(sequenceNumber-2))
)

Object fibonacciWhile := method(sequenceNumber,
	if(sequenceNumber<3, return 1)
	i := 1
	fib2 := 1
	fib1 := 1
	cur := 0
	for(i, 3, sequenceNumber, (
		cur = fib2+fib1
		fib2 = fib1
		fib1 = cur
	))
	return cur
)

writeln("fibonacci(1) is: ",fibonacci(1))	
writeln("fibonacci(2) is: ",fibonacci(2))
writeln("fibonacci(3) is: ",fibonacci(3))
writeln("fibonacci(4) is: ",fibonacci(4))
writeln("fibonacci(5) is: ",fibonacci(5))
writeln("fibonacci(6) is: ",fibonacci(6))
writeln("fibonacci(7) is: ",fibonacci(7))
writeln("fibonacci(8) is: ",fibonacci(8))
writeln("fibonacci(9) is: ",fibonacci(9))
writeln("fibonacci(10) is: ",fibonacci(10))

writeln("fibonacciWhile(1) is: ",fibonacciWhile(1))	
writeln("fibonacciWhile(2) is: ",fibonacciWhile(2))
writeln("fibonacciWhile(3) is: ",fibonacciWhile(3))
writeln("fibonacciWhile(4) is: ",fibonacciWhile(4))
writeln("fibonacciWhile(5) is: ",fibonacciWhile(5))
writeln("fibonacciWhile(6) is: ",fibonacciWhile(6))
writeln("fibonacciWhile(7) is: ",fibonacciWhile(7))
writeln("fibonacciWhile(8) is: ",fibonacciWhile(8))
writeln("fibonacciWhile(9) is: ",fibonacciWhile(9))
writeln("fibonacciWhile(10) is: ",fibonacciWhile(10))
