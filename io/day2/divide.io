#! /usr/bin/io

# 2. How would you change / to return 0 if the denominator is zero?

OperatorTable println

Number setSlot("division", Number getSlot("/"))
Number setSlot("/",
	method(denominator, 
		if(denominator==0, return 0, return self division(denominator))
	)
)

writeln("15 / 3 = ", 15 / 3)
writeln("15 / 0 (overloaded) = ", 15 / 0)