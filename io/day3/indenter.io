#! /usr/bin/io

Indenter := Object clone

Indenter indentation := ""
Indenter nodeName := ""

Indenter increaseIndent := method(
	self indentation = self indentation .. "    "
)
Indenter decreaseIndent := method(
	self indentation = self indentation exSlice(0, -4)
)

Indenter writeNodeName := method(
	if(self nodeName size > 0, 
		writeln(self nodeName,">")
		self nodeName = ""
	)
)

Indenter curlyBrackets := method(
	self nodeName = self nodeName .. " "
	call message arguments foreach(arg,
		self getAttribute(arg asSimpleString)
	)
)

Indenter getAttribute := method(argumentString,
	key := argumentString exSlice(0,argumentString findSeq(":")) removeSuffix(" ") removeSuffix("\"") removePrefix("\"")
	value := argumentString exSlice(argumentString findSeq(":")+1) removePrefix(" ")
	self nodeName = self nodeName .. key .. "=" .. value .. " "
	nil
)

Indenter forward = method(
	#writeln(self indentation,"<", call message name, ">")

	self writeNodeName
	self nodeName = self indentation .. "<" .. call message name
	
	self increaseIndent
	call message arguments foreach(arg,
		content := self doMessage(arg);
		if(content type == "Sequence", 
			self writeNodeName
			writeln(self indentation, content))
	)
	self decreaseIndent
	writeln(self indentation,"</", call message name, ">")
)

Indenter ul({"author":"wood", "bestseller":"no way!"},
	li("Io"),
	li("Lua"),
	li("Javascript")
)