class Solution:
	@staticmethod
	def solveSudoku(board: list[list[str]]) -> None:
		Solution._solve(board)

	@staticmethod
	def _solve(board: list[list[str]]) -> bool:
		for row in range(9):
			for col in range(9):
				if board[row][col] == '.':
					for num in map(str, range(1, 10)):
						if Solution._is_valid(board, row, col, num):
							board[row][col] = num
							if Solution._solve(board):
								return True
							board[row][col] = '.'
					return False
		return True

	@staticmethod
	def _is_valid(board: list[list[str]], row: int, col: int, num: str) -> bool:
		# check row and column
		for i in range(9):
			if board[row][i] == num or board[i][col] == num:
				return False

		# check 3×3 sub‑grid
		start_row, start_col = (row // 3) * 3, (col // 3) * 3
		for i in range(start_row, start_row + 3):
			for j in range(start_col, start_col + 3):
				if board[i][j] == num:
					return False
		return True



if __name__ == "__main__":
	'''
	board = [
		['5', '3', '.', '.', '7', '.', '.', '.', '.'],
		['6', '.', '.', '1', '9', '5', '.', '.', '.'],
		['.', '9', '8', '.', '.', '.', '.', '6', '.'],
		['8', '.', '.', '.', '6', '.', '.', '.', '3'],
		['4', '.', '.', '8', '.', '3', '.', '.', '1'],
		['7', '.', '.', '.', '2', '.', '.', '.', '6'],
		['.', '6', '.', '.', '.', '.', '2', '8', '.'],
		['.', '.', '.', '4', '1', '9', '.', '.', '5'],
		['.', '.', '.', '.', '8', '.', '.', '7', '9']
	]
	'''    
	board = [[".",".",".",".",".",".",".",".","."],[".","9",".",".","1",".",".","3","."],[".",".","6",".","2",".","7",".","."],[".",".",".","3",".","4",".",".","."],["2","1",".",".",".",".",".","9","8"],[".",".",".",".",".",".",".",".","."],[".",".","2","5",".","6","4",".","."],[".","8",".",".",".",".",".","1","."],[".",".",".",".",".",".",".",".","."]]

	Solution.solveSudoku(board)

	for row in board:
		print(' '.join(row))

