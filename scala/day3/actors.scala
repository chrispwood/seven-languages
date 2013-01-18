import scala.io._
import scala.actors._
import Actor._
import scala.xml.XML
import scala.util.matching.Regex
import scala.util.control.Breaks._
import scala.collection.mutable.MutableList

object PageLoader {
	def getPageSize(url:String) = Source.fromURL(url).mkString.length

	def getLinkCount(url:String):Int = {
		var linkCount = 0
		try {
			val webpage = Source.fromURL(url).mkString
			val linkr = new Regex("""<a\s+href="([^"]*?)"\s*>""", "linkurl")
	
			linkr.findAllIn(webpage).matchData.foreach { m => 
				if(m.subgroups(0).length>1 && !m.subgroups(0).startsWith("javascript:")) {
					linkCount = linkCount + 1
				}
			}
		}
		catch {
			case e: Exception =>
				println(e.toString)
		}

		linkCount
	}

	def getNestedLinkCount(url:String):Int = {
		val webpage = Source.fromURL(url).mkString
		val linkr = new Regex("""<a\s+href="([^"]*?)"\s*>""", "linkurl")

		var links = new MutableList[String]()
		var linkCount = 0

		val caller = self

		linkr.findAllIn(webpage).matchData.foreach { m => 
			if(m.subgroups(0).length>1 && !m.subgroups(0).startsWith("javascript:")) {
				var link = m.subgroups(0)
				if(link(0)=='/') {
					if(url(url.length-1)=='/') {
						link = link.slice(1,link.length)
					}
					link = url + link
				}
				linkCount = linkCount + 1
				//links = links :+ link
				links += link
			}
		}

		/*
		links.foreach { link:String =>
			println(link)
		}
		*/

		links.foreach { link:String =>
			println("link is: " + link)
			actor { caller ! (link, PageLoader.getLinkCount(link)) }
		}

		for(i <- 1 to links.size) {
			receive {
				case (link, count) =>
					println("  " + count)
					linkCount = linkCount + count.asInstanceOf[Int]
			}
		}

		linkCount
	}
}

var urls = List(
		"http://www.amazon.com/",
		"http://www.twitter.com/",
		"http://www.google.com",
		"http://www.cnn.com"
	)

def timeMethod(method:()=>Unit) = {
	val start = System.nanoTime
	method()
	val end = System.nanoTime
	println("Method took " + (end - start)/1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
	for(url <- urls) {
		println("Size for " + url + ": " + PageLoader.getPageSize(url))
	}
}

def getLinkCountConcurrently() = {
	val caller = self

	for(url <- urls) {
		actor { caller ! (url, PageLoader.getLinkCount(url)) }
	}

	for(i <- 1 to urls.size) {
		receive {
			case (url, count) =>
				println("Link count for " + url + ": " + count)
		}
	}
}

def getNestedLinkCountConcurrently() = {
	val caller = self

	for(url <- urls) {
		actor { caller ! (url, PageLoader.getNestedLinkCount(url)) }
	}

	for(i <- 1 to urls.size) {
		receive {
			case (url, count) =>
				println("Link count for " + url + ": " + count)
		}
	}
}

def getPageSizeConcurrently() = {
	val caller = self

	for(url <- urls) {
		actor { caller ! (url, PageLoader.getPageSize(url)) }
	}

	for(i <- 1 to urls.size) {
		receive {
			case (url, size) =>
				println("Size for " + url + ": " + size)
		}
	}
}

println("Sequential run:")
timeMethod { getPageSizeSequentially }
println("Getting Number of links:")
timeMethod { getLinkCountConcurrently }
println("Getting Number of nested links (1 level of depth): ")
timeMethod { getNestedLinkCountConcurrently }