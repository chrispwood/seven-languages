import scala.io._
import collection.mutable.HashMap
import scala.util.matching.Regex

trait Censor {
	var substituteWords = new HashMap[String, String]
	val substituteFilename = "cursewords.txt"

	def loadTraits() {
		Source.fromFile(substituteFilename).getLines().foreach { line => 
			val separatorIndex = line.indexOf(':')
			var key = line.slice(0,separatorIndex).trim()
			var value = line.slice(separatorIndex+1,line.length-1).trim()
			substituteWords += key -> value
		}
	}

	def clean(text:String):String = {
		loadTraits()

		var newText:String = text
		substituteWords.foreach { keyVal => 
			val curseWord = keyVal._1
			val replaceWord = keyVal._2
			println("curse: " + curseWord + "; replace: " + replaceWord + "; book: \n" + newText)
			val regex = new Regex("(?i)" + curseWord)
			newText = regex.replaceAllIn(newText,replaceWord)
		}

		return newText
	}
}

class Book extends Censor {
	var text = ""
	var filename = "booktext.txt"

	def loadTextFromFile(filename:String) {
		// http://stackoverflow.com/questions/1284423/read-entire-file-in-scala
		val source = scala.io.Source.fromFile(filename)
		text = source.mkString
		source.close()
	}

	loadTextFromFile(filename)
	val cleanText = clean(text)
	println("The book's clean text is:\n\n" + cleanText)
}

var book = new Book()