
struct Sudoku {
	let n: Int
	let m: Int
	var size: Int { return n * m }
	
	init(n: Int = 3, m: Int = 3) {
		self.n = n
		self.m = m
	}
}

//MARK: - Console Board
extension Sudoku {
	private var borderTop: String {
		var line = ""
		
		for α in 1...self.size {
			if α == 1 { line += "╔" }
			
			if α == self.size { line += "═══╗" }
			else if α % self.n == 0 { line += "═══╦" }
			else { line += "═══╤" }
		}
			
		return line + "\n"
	}
	
	private var borderBottom: String {
		var line = ""
		
		for α in 1...self.size {
			if α == 1 { line += "╚" }
			
			if α == self.size { line += "═══╝" }
			else if α % self.n == 0 { line += "═══╩" }
			else { line += "═══╧" }
		}
		
		return line
	}
	
	private var borderMid: String {
		var line = ""
		
		for α in 1...self.size {
			if α == 1 { line += "╠" }
			
			if α == self.size { line += "═══╣" }
			else if α % self.n == 0 { line += "═══╬" }
			else { line += "═══╪" }
		}
		
		return line + "\n"
	}
	
	private var borderMidMid: String {
		var line = ""
		
		for α in 1...self.size {
			if α == 1 { line += "╟" }
			
			if α == self.size { line += "───╢" }
			else if α % self.n == 0 { line += "───╫" }
			else { line += "───┼" }
		}
		
		return line + "\n"
	}
		
	func consoleBoard() -> String {
		func row(_ n: Int) -> String {
			var line = ""
			
			for α in 1...self.size {
				if α == 1 { line += "║" }
				
				if α == self.size { line += "   ║" }
				else if α % self.n == 0 { line += "   ║" }
				else { line += "   │" }
			}
			
			return line + "\n"
		}
		
		var board = ""
		
		for i in 1...self.size {
			if i == 1 { board += self.borderTop }
			board += row(i)
			
			if i == self.size { board += self.borderBottom }
			else if i % self.m == 0 { board += self.borderMid }
			else { board += self.borderMidMid }
		}
		
		return board
	}
}
