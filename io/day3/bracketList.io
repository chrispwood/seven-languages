#! /usr/bin/io

BracketList := List clone
BracketList squareBrackets := method(arg,
	return self at(arg)
)

BracketList append(5,10,15,20,25,30,35,40,45,50)
BracketList[5] println