/**
* author: Chris Wood
* date: 01/16/13
* exercise: 7 Languages in 7 Weeks by Bruce Tate
* => Scala Day 2
* Strings exercises
**/

// Use foldLeft to compute the total size of a list of strings
val macbeth = List(
	"Tomorrow, and tomorrow, and tomorrow,",
	"Creeps in this petty pace from day to day,",
	"To the last syllable of recorded time;",
	"And all our yesterdays have lighted fools",
	"The way to dusty death. Out, out brief candle!",
	"Life's but a walking shadow, a poor player",
	"That struts and frets his hour upon the stage",
	"And then is heard no more. It is a tale",
	"Told by an idiot, full of sound and fury",
	"Signifying nothing."
)

val totalSize = (0 /: macbeth) {(totalSize, value) => 
	println(value)
	totalSize + value.length
}
println("\nThe total size is: " + totalSize + " characters.")