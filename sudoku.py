from typing import *

class Solution:
	def solveSudoku (self, board: List[List[str]]) -> None:
		self.board = board
		
		empty = self.FindEmptyCell()
		if not empty:
			return True
			
		row, col = empty
		
		for n in range(1, 10):
			if self.IsValid(row, col, str(n)):
				self.board[row][col] = str(n)
				s = Solution()
				if s.solveSudoku(self.board):
					return True
				s.board[row][col] = '.'

		
		
		return None
        





	def IsValid (self, row, col, num):
		# row check
			
		for c in range(9):
			if str(self.board[row][c]) == str(num):
				return False

		# column check
		for r in range(9):
			if str(self.board[r][col]) == str(num):
				return False
		
		# 3×3 check
		start_row, start_col = 3 * (row // 3), 3 * (col // 3)
		for r in range(start_row, start_row + 3):
			for c in range(start_col, start_col + 3):
				if board[r][c] == num:
					return False
					
		return True


	def FindEmptyCell (self):
		for i in range(9):
			for j in range(9):
				if self.board[i][j] == '.':
					return i, j
		return None




	def PrintBoard (self):
		for i in range(9):
			print(''.join(self.board[i]))



##################################

# MAIN

board = [
	["5","3",".",".","7",".",".",".","."],
	["6",".",".","1","9","5",".",".","."],
	[".","9","8",".",".",".",".","6","."],
	["8",".",".",".","6",".",".",".","3"],
	["4",".",".","8",".","3",".",".","1"],
	["7",".",".",".","2",".",".",".","6"],
	[".","6",".",".",".",".","2","8","."],
	[".",".",".","4","1","9",".",".","5"],
	[".",".",".",".","8",".",".","7","9"]
]

s = Solution()
s.solveSudoku(board)
s.PrintBoard()



