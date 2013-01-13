
/**
* author: Chris Wood
* date: 01/12/13
* exercise: 7 Languages in 7 Weeks by Bruce Tate
* => Scala Day 1
* Tic Tac Toe implementation with two players
**/

class TicTacToe {

	var board = Array(Array("","",""),Array("","",""),Array("","",""))
	var numberPlayers = 0

	def printBoard() {
		println("_______")
		for(i <- 0 until board.length) {
			val row = board(i)
			print("|")
			for(j <- 0 until row.length) {
				val column = row(j)
				if(column=="") {
					print("_")
				}
				else {
					print(column)
				}
				print("|")
			}
			println("")
		}
	}

	def isDraw():Boolean = {
		for(i <- 0 until board.length) {
			val row = board(i)
			for(j <- 0 until row.length) {
				val column = row(j)

				if(column=="") {
					return false
				}
			}
		}
		return true
	}

	def testRow(rowNum:Int, symbol:String):Boolean = {
		board(rowNum)(0)==symbol && 
	    	board(rowNum)(1)==symbol &&
	    	board(rowNum)(2)==symbol
	}

	def testColumn(colNum:Int, symbol:String):Boolean = {
		board(0)(colNum)==symbol &&
			board(1)(colNum)==symbol &&
			board(2)(colNum)==symbol
	}

	def testDiag(symbol:String):Boolean = {
		(board(0)(0)==symbol &&
		 	board(1)(1)==symbol &&
		 	board(2)(2)==symbol) ||
			(board(0)(2)==symbol &&
		 	board(1)(1)==symbol &&
		 	board(2)(0)==symbol)
	}

	def isPlayerWinner(symbol:String):Boolean = {
		testRow(0,symbol) || testRow(1,symbol) || testRow(2,symbol) ||
			testColumn(0,symbol) || testColumn(1,symbol) || testColumn(2,symbol) ||
			testDiag(symbol)
	}

	def enterNumPlayers() {
		println("Welcome to TicTacToe.  Please enter the number of players (1 or 2):")

		numberPlayers = readLine().toInt
		while(numberPlayers<1 || numberPlayers >2) {
			System.err.println("Please enter the number of players between 1 and 2:")
			numberPlayers = readLine().toInt
		}
	}

	def getInput(player: String):Array[Int] = {
		var line = ""
		var result = Array("")

		while(result.length != 2) {
			println(player + ", please enter your move in by row and column separated by a space:")
			line = readLine()

			try {
				result = line.trim.split(" ")

				if(result.length==2) {
					var input1 = result(0).toInt
					var input2 = result(1).toInt

					if(input1<1||input1>3||input2<1||input2>3) {
						println("  Invalid move - the move must be row(0-2) and column(0-2).  Example: 1 1")
						result = Array()					
					}

					if(board(input1-1)(input2-1)!="") {
						println("  Invalid move - row(" + input1 + ") and column(" + input2 + ") have already been played")
						result = Array()
					}
				}
			}
			catch {
				case e: Exception =>
					println("You must input a valid move by row(0-2) and column(0-2) separated by a space.  Example: 0 2\n")
					result = Array()
			}

		}

		Array(result(0).toInt,result(1).toInt)
	}

	def player1Turn() {
		var move = getInput("Player 1")
		board(move(0)-1)(move(1)-1) = "X"
		println("move is " + move(0) + " " + move(1))
	}

	def playerTurn(playerName:String, playerMarker:String) {
		var move = getInput(playerName)


		board(move(0)-1)(move(1)-1) = playerMarker
	}

	def startGame() {
		enterNumPlayers()

		var continue = true
		while(continue) {
			
			printBoard
			playerTurn("Player1","X")
			if(isPlayerWinner("X")) {
				println("Player 1 wins!")
				continue = false
			}
			else if(isDraw()) {
				println("A draw. Better luck next time!")
				continue = false
			}
			else if(numberPlayers==2) {
				// player 2 round
				printBoard
				playerTurn("Player2","O")
				if(isPlayerWinner("O")) {
					println("Player 2 wins!")
					continue = false
				}
			}
		}
	}
}

var game = new TicTacToe()
game.startGame()