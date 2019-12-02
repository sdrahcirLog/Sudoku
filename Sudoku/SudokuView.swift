//
//  SudokuView.swift
//  Sudoku
//
//  Created by Logan Richards on 11/29/19.
//  Copyright © 2019 ZER0 Tech. All rights reserved.
//

import SwiftUI

struct SudokuView: View {
	@ObservedObject var sud: Sudoku
	
    var body: some View {
		VStack(spacing: 2) {
			VStack(spacing: 0.5) {
				SudokuRowView(sud: self.sud, row: 0)
				SudokuRowView(sud: self.sud, row: 1)
				SudokuRowView(sud: self.sud, row: 2)
			}
			
			VStack(spacing: 0.5) {
				SudokuRowView(sud: self.sud, row: 3)
				SudokuRowView(sud: self.sud, row: 4)
				SudokuRowView(sud: self.sud, row: 5)
			}
			
			VStack(spacing: 0.5) {
				SudokuRowView(sud: self.sud, row: 6)
				SudokuRowView(sud: self.sud, row: 7)
				SudokuRowView(sud: self.sud, row: 8)
			}
		}.background(Color.black).border(Color.black, width: 2)
		.aspectRatio(1, contentMode: .fit)
    }
}

struct SudokuRowView: View {
	@ObservedObject var sud: Sudoku
	let row: Int
	
    var body: some View {
		HStack(spacing: 2) {
			HStack(spacing: 0.5) {
				SudokuCellView(myCell: self.sud.board[row][0])
				SudokuCellView(myCell: self.sud.board[row][1])
				SudokuCellView(myCell: self.sud.board[row][2])
			}
			
			HStack(spacing: 0.5) {
				SudokuCellView(myCell: self.sud.board[row][3])
				SudokuCellView(myCell: self.sud.board[row][4])
				SudokuCellView(myCell: self.sud.board[row][5])
			}
			
			HStack(spacing: 0.5) {
				SudokuCellView(myCell: self.sud.board[row][6])
				SudokuCellView(myCell: self.sud.board[row][7])
				SudokuCellView(myCell: self.sud.board[row][8])
			}
		}
	}
}



struct SudokuNumberView: View {
	let number: Int
	var hide: Bool = false
	
	var backgroundColor: Color = .black
	var foregroundColor: Color = .white
	
	var imageName: String {
		get {
			switch number {
			case 1:
				return "1.square.fill"
			case 2:
				return "2.square.fill"
			case 3:
				return "3.square.fill"
			case 4:
				return "4.square.fill"
			case 5:
				return "5.square.fill"
			case 6:
				return "6.square.fill"
			case 7:
				return "7.square.fill"
			case 8:
				return "8.square.fill"
			case 9:
				return "9.square.fill"
			default:
				return "1.square.fill"
			}
			
		}
	}
	
    var body: some View {
		ZStack {
			if(!hide) {
				RoundedRectangle(cornerRadius: 100)
					.foregroundColor(backgroundColor)
			}
			
			Image(systemName: self.imageName)
				.resizable()
				.foregroundColor(foregroundColor)
		}.background(foregroundColor)
    }
	
}

struct SudokuCellNoteView: View {
	let hide: [Bool]
	
    var body: some View {
		VStack(spacing: 0.0) {
			HStack(spacing: 0.0) {
				SudokuNumberView(number: 1, hide: self.hide[0])
				SudokuNumberView(number: 2, hide: self.hide[1])
				SudokuNumberView(number: 3, hide: self.hide[2])
			}
			
			HStack(spacing: 0.0) {
				SudokuNumberView(number: 4, hide: self.hide[3])
				SudokuNumberView(number: 5, hide: self.hide[4])
				SudokuNumberView(number: 6, hide: self.hide[5])
			}
			
			HStack(spacing: 0.0) {
				SudokuNumberView(number: 7, hide: self.hide[6])
				SudokuNumberView(number: 8, hide: self.hide[7])
				SudokuNumberView(number: 9, hide: self.hide[8])
			}
		}
    }
}

struct SudokuCellView: View {
	let myCell: SudokuCell
	
    var body: some View {
		ZStack {
			SudokuCellNoteView(hide: myCell.getHide())
			
			if(myCell.number > 0 && myCell.number < 10) {
				SudokuNumberView(number: myCell.number, backgroundColor: myCell.backgroundColor, foregroundColor: myCell.foregroundColor)
			}
		}
    }
}

struct SudokuView_Previews: PreviewProvider {
    static var previews: some View {
		SudokuView(sud: Sudoku()).previewLayout(.fixed(width: 500, height: 500))
    }
}
